# One Dark (warmer) syntax highlighting for fish.
# Matches kitty/tmux/starship. Colours follow the semantic roles of
# navarasu/onedark.nvim's warmer palette: functions are blue, keywords
# purple, strings green, identifiers yellow, operators red, comments grey.

set -l fg          A7AAB0
set -l grey        5A5B5E
set -l light_grey  818387
set -l bg3         37383D
set -l blue        57A5E5
set -l purple      BB70D2
set -l green       8FB573
set -l yellow      DBB671
set -l cyan        51A8B3
set -l red         DE5D68
set -l orange      C49060
set -l bright_red  E86671

# Syntax Highlighting Colors
set -g fish_color_normal $fg
set -g fish_color_command $blue
set -g fish_color_keyword $purple
set -g fish_color_quote $green
set -g fish_color_param $yellow
set -g fish_color_option $cyan
set -g fish_color_redirection $red
set -g fish_color_operator $red
set -g fish_color_end $red
set -g fish_color_escape $orange
set -g fish_color_error $bright_red
set -g fish_color_comment $grey
set -g fish_color_autosuggestion $light_grey
set -g fish_color_selection --background=$bg3
set -g fish_color_search_match --background=$bg3

# Completion Pager Colors
set -g fish_pager_color_progress $grey
set -g fish_pager_color_prefix $blue
set -g fish_pager_color_completion $fg
set -g fish_pager_color_description $grey
set -g fish_pager_color_selected_background --background=$bg3
