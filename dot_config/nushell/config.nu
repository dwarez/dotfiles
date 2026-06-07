# config.nu — Nushell interactive config
#
# Managed by chezmoi. Replicates the omerxx terminal workflow, adapted for
# MLOps work (lots of JSON/YAML/tables). Vim mode is ON.

# ── Shell behaviour ──────────────────────────────────────────────
$env.config.show_banner = false
$env.config.edit_mode = "vi"                 # << vim motions on the command line
$env.config.cursor_shape.vi_insert = "line"  # thin bar in insert mode
$env.config.cursor_shape.vi_normal = "block" # block in normal mode (visible mode cue)
$env.config.completions.algorithm = "fuzzy"
$env.config.completions.external.enable = true
$env.config.completions.case_sensitive = false
$env.config.history.file_format = "sqlite"
$env.config.rm.always_trash = true

# ── POSIX escape hatch ───────────────────────────────────────────
# nushell isn't POSIX. Two ways out without leaving nu for good:
#   1. Type `bash` or `zsh` for a full interactive POSIX subshell (exit returns).
#   2. Run a one-liner inline:  b 'export X=1 && env | grep X'
def --wrapped b  [...rest] { ^bash -c ($rest | str join ' ') }   # bash one-liner
def --wrapped zc [...rest] { ^zsh  -c ($rest | str join ' ') }   # zsh  one-liner

# ── Navigation ───────────────────────────────────────────────────
# cd into a path and immediately list it (omerxx's signature helper).
def --env cx [arg] { cd $arg; ls }

# ── Aliases: listing (eza, matches the old fish abbreviations) ───
alias ll = eza -lh  --group-directories-first --icons --git
alias la = eza -lah --group-directories-first --icons --git
alias lt = eza --tree --level=2 --icons
alias l2 = eza --tree --level=2 --icons -lh
alias c  = clear
alias v  = nvim

# ── Aliases: git ─────────────────────────────────────────────────
alias gst   = git status
alias gco   = git checkout
alias gb    = git branch
alias gba   = git branch -a
alias gadd  = git add
alias ga    = git add -p
alias gc    = git commit -m
alias gca   = git commit -a -m
alias gp    = git push origin HEAD
alias gpu   = git pull origin
alias gdiff = git diff
alias gre   = git reset
alias glog  = git log --graph --oneline --decorate --all

# ── Aliases: kubernetes / MLOps ─────────────────────────────────
alias k    = kubectl
alias ka   = kubectl apply -f
alias kg   = kubectl get
alias kgpo = kubectl get pod
alias kgd  = kubectl get deployments
alias kd   = kubectl describe
alias kdel = kubectl delete
alias kl   = kubectl logs
alias ke   = kubectl exec -it
alias kc   = kubectx
alias kns  = kubens

# ── Tool integrations (init files generated in env.nu) ───────────
source ~/.zoxide.nu                       # z / zi directory jumping
source ~/.cache/carapace/init.nu          # multi-shell completions
source ~/.local/share/atuin/init.nu       # Ctrl-R fuzzy history
use ~/.cache/starship/init.nu             # prompt
