# env.nu — Nushell environment (runs before config.nu)
#
# Managed by chezmoi. Nushell is the *interactive* shell (launched by kitty /
# tmux). The login shell stays POSIX (fish/zsh) for root, tty, ssh and scripts.

# ── PATH ──────────────────────────────────────────────────────────
use std "path add"
path add "/opt/homebrew/bin"
path add "/opt/homebrew/sbin"
path add ($env.HOME | path join ".local" "bin")
path add ($env.HOME | path join ".cargo" "bin")
$env.PATH = ($env.PATH | uniq)

# ── Core environment ─────────────────────────────────────────────
$env.EDITOR = "nvim"
$env.VISUAL = "nvim"
$env.STARSHIP_CONFIG = ($env.HOME | path join ".config" "starship.toml")
# Pull completions from these shells when carapace has no native spec.
$env.CARAPACE_BRIDGES = 'zsh,bash,fish'

# ── Generate integration init files (regenerated each launch) ────
# Each tool prints a Nushell script we source/use from config.nu.
mkdir ($env.HOME | path join ".cache" "starship")
starship init nu | save -f ($env.HOME | path join ".cache" "starship" "init.nu")

zoxide init nushell | save -f ($env.HOME | path join ".zoxide.nu")

mkdir ($env.HOME | path join ".cache" "carapace")
carapace _carapace nushell | save -f ($env.HOME | path join ".cache" "carapace" "init.nu")

mkdir ($env.HOME | path join ".local" "share" "atuin")
atuin init nu --disable-up-arrow | save -f ($env.HOME | path join ".local" "share" "atuin" "init.nu")
