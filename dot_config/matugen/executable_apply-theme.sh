#!/usr/bin/env bash
# Apply a wallpaper-derived theme via matugen.
# Usage: apply-theme.sh /path/to/wallpaper.jpg
#
# On macOS:
#   - Install matugen:  brew install matugen
#   - Optionally also set the desktop wallpaper:
#       osascript -e 'tell application "System Events" to set picture of every desktop preferences to POSIX file "'"$1"'"'
#
# On Linux: prefer letting noctalia drive template regeneration; this script
# is mostly for macOS parity.

set -euo pipefail

if [[ $# -lt 1 ]]; then
  echo "usage: $(basename "$0") <wallpaper-path>" >&2
  exit 2
fi

wallpaper="$1"
if [[ ! -f "$wallpaper" ]]; then
  echo "wallpaper not found: $wallpaper" >&2
  exit 1
fi

if ! command -v matugen >/dev/null 2>&1; then
  echo "matugen not found. Install with: cargo install matugen" >&2
  exit 1
fi

# On macOS matugen looks for its config under ~/Library/Application Support,
# not ~/.config, so point at the config explicitly.
config="$HOME/.config/matugen/config.toml"

# matugen v4 needs a preference when an image yields multiple source colours.
# "saturation" picks the most vivid accent. Override with MATUGEN_PREFER.
matugen -c "$config" image "$wallpaper" --prefer "${MATUGEN_PREFER:-saturation}"

# Optional: set macOS desktop wallpaper too.
if [[ "$(uname)" == "Darwin" ]] && [[ "${SET_WALLPAPER:-0}" == "1" ]]; then
  osascript -e "tell application \"System Events\" to set picture of every desktop preferences to POSIX file \"$wallpaper\""
fi
