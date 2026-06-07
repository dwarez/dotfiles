#!/usr/bin/env bash
# tmux cheat-sheet — shown in a popup via `prefix + ?`.
# Reflects the actual bindings in ~/.config/tmux/tmux.conf. Keep in sync if you
# change keys. Closes on any keypress.

b=$'\e[1m'; d=$'\e[2m'; c=$'\e[36m'; y=$'\e[33m'; g=$'\e[32m'; r=$'\e[0m'
key() { printf "  ${y}%-12s${r} %s\n" "$1" "$2"; }
hdr() { printf "\n${b}${c}%s${r}\n" "$1"; }

clear
printf "${b}  tmux cheat-sheet${r}   ${d}prefix = Ctrl+Space${r}\n"
printf "${d}  ─────────────────────────────────────────────────────────────${r}\n"

hdr "Sessions"
key "prefix o"   "sessionx — fuzzy session switcher (zoxide)"
key "prefix d"   "detach"
key "prefix s"   "list / switch sessions"
key "prefix \$"   "rename session"

hdr "Windows (tabs)"
key "prefix c"   "new window (keeps cwd)"
key "S-Left/Right" "previous / next window"
key "M-H / M-L"  "previous / next window (Alt)"
key "prefix 1-9" "go to window N"
key "prefix ,"   "rename window"

hdr "Panes (splits)"
key "prefix %"   "split vertical  (left|right)"
key "prefix \""   "split horizontal (top/bottom)"
key "Alt+hjkl"   "move between panes (no prefix, zellij-style)"
key "Alt+arrows" "move between panes (no prefix)"
key "C-h/j/k/l"  "move panes + nvim splits (seamless)"
key "prefix z"   "zoom / unzoom pane"
key "prefix x"   "kill pane"
key "prefix p"   "floax — floating scratch pane"

hdr "Scroll & copy (vi copy-mode)"
key "prefix ["   "enter copy-mode (scroll up)"
key "/  ?"       "search forward / back   (n / N to repeat)"
key "v"          "begin selection"
key "C-v"        "block / column selection"
key "y"          "copy to clipboard, then 'v G y' = here→end"
key "prefix ]"   "paste"
key "prefix Space" "thumbs — hint-copy paths/hashes/IPs/URLs"
key "prefix u"   "fzf-url — open a URL from the scrollback"

hdr "Misc"
key "prefix r"   "reload tmux config"
key "prefix ?"   "this cheat-sheet"

printf "\n${d}  press any key to close${r}\n"
read -rsn1
