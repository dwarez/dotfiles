# Dracula syntax highlighting for fish (official palette values).
# Matches kitty/tmux/starship. GREEN is deliberately unused for syntax: it is
# the only Dracula colour that collapses under simulated colour deficiency
# (3.2 vs orange, 3.6 vs yellow, 7.3 vs cyan). The six accents used here sit
# at least 8.4 CIEDE2000 apart.

set -l fg      F8F8F2
set -l comment 6272A4
set -l cyan    8BE9FD
set -l pink    FF79C6
set -l purple  BD93F9
set -l red     FF5555
set -l yellow  F1FA8C
set -l orange  FFB86C
set -l sel     44475A

# Syntax Highlighting Colors
set -g fish_color_normal $fg
set -g fish_color_command $cyan
set -g fish_color_keyword $pink
set -g fish_color_quote $yellow
set -g fish_color_param $orange
set -g fish_color_option $purple
set -g fish_color_redirection $pink
set -g fish_color_operator $pink
set -g fish_color_end $pink
set -g fish_color_escape $purple
set -g fish_color_error $red
set -g fish_color_comment $comment
set -g fish_color_autosuggestion $comment
set -g fish_color_selection --background=$sel
set -g fish_color_search_match --background=$sel

# Completion Pager Colors
set -g fish_pager_color_progress $comment
set -g fish_pager_color_prefix $cyan
set -g fish_pager_color_completion $fg
set -g fish_pager_color_description $comment
set -g fish_pager_color_selected_background --background=$sel
