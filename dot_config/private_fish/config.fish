if status is-interactive
    # No "Welcome to fish" greeting
    set -g fish_greeting ""

    # ── Vim mode on the command line ──
    fish_vi_key_bindings

    # ── Prompt & tools ──
    starship init fish | source
    zoxide init fish | source            # z <dir> jumping
    atuin init fish --disable-up-arrow | source  # Ctrl-R fuzzy history

    # ── Listing (eza) ──
    abbr --add ll 'eza -lh --group-directories-first --icons --git'
    abbr --add la 'eza -lah --group-directories-first --icons --git'
    abbr --add lt 'eza --tree --level=2 --icons'
    abbr --add l2 'eza --tree --level=2 --icons -lh'

    # ── git ──
    abbr --add gst 'git status'
    abbr --add gco 'git checkout'
    abbr --add gb 'git branch'
    abbr --add ga 'git add -p'
    abbr --add gadd 'git add'
    abbr --add gc 'git commit -m'
    abbr --add gca 'git commit -a -m'
    abbr --add gp 'git push origin HEAD'
    abbr --add gpu 'git pull origin'
    abbr --add gdiff 'git diff'

    # ── kubernetes / MLOps ──
    abbr --add k 'kubectl'
    abbr --add kg 'kubectl get'
    abbr --add kgpo 'kubectl get pod'
    abbr --add kd 'kubectl describe'
    abbr --add kl 'kubectl logs'
    abbr --add ke 'kubectl exec -it'
    abbr --add ka 'kubectl apply -f'
end

# ── Environment & PATH (also for non-interactive shells) ──
set -gx EDITOR nvim
set -gx VISUAL nvim
fish_add_path $HOME/.local/bin $HOME/.cargo/bin /opt/homebrew/bin /opt/homebrew/sbin

# cx: cd into a directory and immediately list it
function cx --argument dir
    cd $dir; and eza -lh --group-directories-first --icons --git
end
