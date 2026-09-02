#!/bin/sh
set -eu

state_dir="${TMPDIR:-/tmp}/omp-tmux-notify-$(id -u)"
lock_dir="$state_dir/.lock"
mkdir -p "$state_dir"
if ! mkdir "$lock_dir" 2>/dev/null; then
  exit 0
fi
cleanup() {
  rmdir "$lock_dir" 2>/dev/null || true
}
trap cleanup EXIT HUP INT TERM

tmux list-panes -a -F '#{pane_id}' | while IFS= read -r pane; do
  [ -n "$pane" ] || continue
  title="$(tmux display-message -p -t "$pane" '#{pane_title}' 2>/dev/null || true)"
  case "$title" in
    'π ! '*) waiting=1 ;;
    *) waiting=0 ;;
  esac

  state_file="$state_dir/${pane#%}"
  if [ ! -f "$state_file" ]; then
    printf '%s\n' "$waiting" > "$state_file"
    continue
  fi

  previous="$(cat "$state_file" 2>/dev/null || printf '0')"
  [ "$previous" = "$waiting" ] && continue
  printf '%s\n' "$waiting" > "$state_file"
  [ "$waiting" = 1 ] || continue

  body="${title#π ! }"
  [ -n "$body" ] || body='OMP is waiting for input'
  /usr/bin/osascript \
    -e 'on run argv' \
    -e 'display notification (item 1 of argv) with title "Oh My Pi" sound name "Glass"' \
    -e 'end run' \
    "$body" >/dev/null 2>&1 &
done
