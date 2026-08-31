# Modus vivendi (deuteranopia) syntax highlighting for fish.
# Matches kitty/tmux/starship. Only SIX chromatic slots are used: under
# red-green colour deficiency no more than ~6 colours stay mutually
# distinguishable (measured, CIEDE2000 under Machado severity-1.0), so extra
# hues would only add confusion. Roles also form a lightness ladder.

set -l fg        FFFFFF
set -l keyword   EFEF00
set -l type      C4D5FF
set -l string    00D3D0
set -l func      FFA00F
set -l comment   989898
set -l error     FF5F59
set -l selection 3A3A4A
set -l dim       7A7A7A

# Syntax Highlighting Colors
set -g fish_color_normal $fg
set -g fish_color_command $func
set -g fish_color_keyword $keyword
set -g fish_color_quote $string
set -g fish_color_param $type
set -g fish_color_option $keyword
set -g fish_color_redirection $func
set -g fish_color_operator $fg
set -g fish_color_end $func
set -g fish_color_escape $type
set -g fish_color_error $error
set -g fish_color_comment $comment
set -g fish_color_autosuggestion $dim
set -g fish_color_selection --background=$selection
set -g fish_color_search_match --background=$selection

# Completion Pager Colors
set -g fish_pager_color_progress $comment
set -g fish_pager_color_prefix $keyword
set -g fish_pager_color_completion $fg
set -g fish_pager_color_description $comment
set -g fish_pager_color_selected_background --background=$selection
