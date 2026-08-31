# Vesper syntax highlighting for fish.
# Matches kitty/tmux/starship. Vesper commits to only three real accents
# (red, peach, mint) plus greys — deliberately few, so there is little to
# confuse. Roles lean on lightness as much as hue.

set -l fg      FFFFFF
set -l muted   A0A0A0
set -l dim     707070
set -l red     FF8080
set -l peach   FFC799
set -l mint    99FFE4
set -l mintMid 66CBB2
set -l slate   74828D
set -l sel     343434

# Syntax Highlighting Colors
set -g fish_color_normal $fg
set -g fish_color_command $peach
set -g fish_color_keyword $mint
set -g fish_color_quote $mintMid
set -g fish_color_param $fg
set -g fish_color_option $muted
set -g fish_color_redirection $slate
set -g fish_color_operator $muted
set -g fish_color_end $slate
set -g fish_color_escape $mintMid
set -g fish_color_error $red
set -g fish_color_comment $dim
set -g fish_color_autosuggestion $dim
set -g fish_color_selection --background=$sel
set -g fish_color_search_match --background=$sel

# Completion Pager Colors
set -g fish_pager_color_progress $dim
set -g fish_pager_color_prefix $peach
set -g fish_pager_color_completion $fg
set -g fish_pager_color_description $dim
set -g fish_pager_color_selected_background --background=$sel
