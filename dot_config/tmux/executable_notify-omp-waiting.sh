#!/bin/sh
# omp "agent stopped" watcher for tmux.
#
# omp (tui.titleState) encodes the run state in the pane title:
#   "π <spinner> …"  working
#   "π > …"          your turn — the agent finished its answer
#   "π ! …"          waiting on you (ask tool)
#
# poll (default; called from status-right every status-interval):
#   - edge-detects transitions INTO a waiting state, per pane
#   - on transition: kitty-native notification (osascript fallback) + latch the pane,
#     unless its window is on screen (current window of an attached client)
#   - sets window option @omp-waiting on windows with latched panes
#     (tab highlight, see onedark.conf window-status-format)
#   - prints a status-right badge with the latched count
# clear <window_id> (session-window-changed / client-session-changed hooks in tmux.conf):
#   - drops the latches of that window's panes and its tab highlight
set -eu

state_dir="${TMPDIR:-/tmp}/omp-tmux-notify-$(id -u)"
mkdir -p "$state_dir"

# notify <pane_id> <body>
# Kitty-native notification (OSC 99, built by `kitten notify`) written straight
# to the tty of a kitty-backed tmux client — preferring one attached to the
# pane's session — so clicking it focuses that kitty window. Bypasses tmux, so
# allow-passthrough can stay off. Falls back to osascript without a kitty client.
notify() {
  sid="$(tmux display-message -p -t "$1" '#{session_id}' 2>/dev/null || true)"
  pick='$1 == "xterm-kitty" { print $2; exit }'
  tty=''
  [ -n "$sid" ] && tty="$(tmux list-clients -t "$sid" -F '#{client_termname} #{client_tty}' 2>/dev/null | awk "$pick")"
  [ -n "$tty" ] || tty="$(tmux list-clients -F '#{client_termname} #{client_tty}' 2>/dev/null | awk "$pick")"
  if [ -n "$tty" ] && command -v kitten >/dev/null 2>&1 &&
     seq="$(kitten notify --only-print-escape-code --app-name 'Oh My Pi' \
              --type omp-waiting --identifier "omp-${1#%}" --sound-name silent \
              'Oh My Pi' "$2" 2>/dev/null)"; then
    printf '%s' "$seq" > "$tty"
    # kitty doesn't play custom macOS sound names; play it ourselves.
    /usr/bin/afplay /System/Library/Sounds/Frog.aiff >/dev/null 2>&1 &
  else
    /usr/bin/osascript \
      -e 'on run argv' \
      -e 'display notification (item 1 of argv) with title "Oh My Pi" sound name "Frog"' \
      -e 'end run' \
      "$2" >/dev/null 2>&1 &
  fi
}

if [ "${1:-poll}" = clear ]; then
  win="${2:-}"
  [ -n "$win" ] || exit 0
  for pane in $(tmux list-panes -t "$win" -F '#{pane_id}' 2>/dev/null); do
    id="${pane#%}"
    title="$(tmux display-message -p -t "$pane" '#{pane_title}' 2>/dev/null || true)"
    # Record the CURRENT waiting state (not 0) so a pane that is still
    # sitting at "π >" does not re-latch on the next poll.
    case "$title" in
      'π > '*|'π ! '*) printf '1\n' > "$state_dir/$id" 2>/dev/null || true ;;
      *)               printf '0\n' > "$state_dir/$id" 2>/dev/null || true ;;
    esac
    rm -f "$state_dir/$id.latch"
  done
  tmux set-option -wq -t "$win" -u @omp-waiting 2>/dev/null || true
  exit 0
fi

# ── poll ─────────────────────────────────────────────────────
# Cheap mutex; recover a lock orphaned by a killed poll (>60s old).
lock_dir="$state_dir/.lock"
if ! mkdir "$lock_dir" 2>/dev/null; then
  now=$(date +%s)
  mtime=$(stat -f %m "$lock_dir" 2>/dev/null || echo 0)
  if [ $((now - mtime)) -gt 60 ]; then
    rmdir "$lock_dir" 2>/dev/null || true
    mkdir "$lock_dir" 2>/dev/null || exit 0
  else
    exit 0
  fi
fi
trap 'rmdir "$lock_dir" 2>/dev/null || true' EXIT HUP INT TERM

# Windows currently on screen: a pane finishing there is seen, never latched.
shown=" $(tmux list-clients -F '#{window_id}' 2>/dev/null | tr '\n' ' ')"
live=''
latched=0
for pane in $(tmux list-panes -a -F '#{pane_id}'); do
  id="${pane#%}"
  live="$live $id"
  state_file="$state_dir/$id"
  latch_file="$state_dir/$id.latch"

  title="$(tmux display-message -p -t "$pane" '#{pane_title}' 2>/dev/null || true)"
  case "$title" in
    'π > '*|'π ! '*) waiting=1 ;;
    *)               waiting=0 ;;
  esac

  if [ ! -f "$state_file" ]; then
    printf '%s\n' "$waiting" > "$state_file"   # first sight: seed, no notify
  else
    previous="$(cat "$state_file" 2>/dev/null || printf '0')"
    if [ "$previous" != "$waiting" ]; then
      printf '%s\n' "$waiting" > "$state_file"
      if [ "$waiting" = 1 ]; then
        case "$title" in
          'π ! '*) body="Waiting for input: ${title#π ! }" ;;
          *)       body="Finished: ${title#π > }" ;;
        esac
        loc="$(tmux display-message -p -t "$pane" '#{session_name}:#{window_index} #{window_name}' 2>/dev/null || true)"
        [ -n "$loc" ] && body="$body  ($loc)"
        notify "$pane" "$body"
        win="$(tmux display-message -p -t "$pane" '#{window_id}' 2>/dev/null || true)"
        case "$shown" in
          *" $win "*) ;;
          *) : > "$latch_file" ;;
        esac
      else
        rm -f "$latch_file"
      fi
    fi
  fi
  [ -f "$latch_file" ] && latched=$((latched + 1))
done

# Prune state/latch files of panes that no longer exist.
for f in "$state_dir"/*; do
  [ -f "$f" ] || continue
  base="${f##*/}"
  base="${base%.latch}"
  case " $live " in
    *" $base "*) ;;
    *) rm -f "$state_dir/$base" "$state_dir/$base.latch" ;;
  esac
done

# Sync window highlight flags with latches.
latched_windows=''
for f in "$state_dir"/*.latch; do
  [ -f "$f" ] || continue
  id="${f##*/}"
  id="${id%.latch}"
  w="$(tmux display-message -p -t "%$id" '#{window_id}' 2>/dev/null || true)"
  [ -n "$w" ] && latched_windows="$latched_windows $w"
done
tmux list-windows -a -F '#{window_id} #{@omp-waiting}' 2>/dev/null | while read -r win flag; do
  [ -n "$win" ] || continue
  case " $latched_windows " in
    *" $win "*) [ -n "$flag" ] || tmux set-option -wq -t "$win" @omp-waiting 1 ;;
    *)          [ -z "$flag" ] || tmux set-option -wq -t "$win" -u @omp-waiting ;;
  esac
done

# status-right owns all styling; #() emits plain text only.
if [ "$latched" -gt 0 ]; then
  printf '  π %s  ' "$latched"
fi
