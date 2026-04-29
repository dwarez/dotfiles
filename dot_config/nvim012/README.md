# nvim012

Minimal Neovim 0.12 config using the built-in `vim.pack` plugin manager. Lives alongside the main LazyVim config at `~/.config/nvim`.

## Launch

```sh
NVIM_APPNAME=nvim012 nvim
```

Add a shell alias if you want:

```fish
alias nvim12 'NVIM_APPNAME=nvim012 nvim'
```

## First run

On first launch `vim.pack` will clone all plugins into `~/.local/share/nvim012/site/pack/core/opt/`. Then nvim-treesitter installs parsers on demand via the `tree-sitter` CLI.

### System prerequisites

- **Neovim 0.12+**
- **tree-sitter CLI** `>= 0.26` — `pacman -S tree-sitter-cli` (CachyOS) or `npm i -g tree-sitter-cli`
- **C compiler** (`gcc`/`clang`) on PATH — parsers are compiled locally
- **LSP servers** (optional; each server is only enabled if its binary exists):
  - `pyright-langserver` — `pipx install pyright` or `npm i -g pyright`
  - `ruff` — `pipx install ruff`
  - `lua-language-server` — `pacman -S lua-language-server`

## Layout

```
init.lua                 entry
lua/options.lua          vim.opt / vim.g
lua/keymaps.lua          global maps
lua/plugins.lua          single vim.pack.add call + requires
lua/plugins/
  colorscheme.lua        kanagawa-dragon
  treesitter.lua         nvim-treesitter (main branch rewrite)
  lsp.lua                vim.lsp.config / vim.lsp.enable
  blink.lua              blink.cmp (matches old keymap)
  snacks.lua             folke/snacks (claudecode dep)
  claudecode.lua         coder/claudecode.nvim
  lualine.lua            statusline
```

## Managing plugins

- Update all: `:lua vim.pack.update()`
- Update one: `:lua vim.pack.update({ 'blink.cmp' })`
- Remove: `:lua vim.pack.del({ 'name' })`
- List: `:lua vim.print(vim.pack.get())`

`vim.pack` does **not** do lazy loading — everything loads at startup. That's the trade-off for minimalism.

## Notes on Neovim 0.12 quirks

- `nvim-treesitter` main branch is a full rewrite — the old `nvim-treesitter.configs` module is gone. We use `require('nvim-treesitter').install()` and start highlighting via `vim.treesitter.start` in a `FileType` autocmd.
- LSP setup uses the native `vim.lsp.config` / `vim.lsp.enable` API. `nvim-lspconfig` is only included for its pre-packaged server configs in `lsp/*.lua`.
- `vim.treesitter.get_parser` now returns `nil` instead of erroring on missing parsers — handled by the `pcall` in the autocmd.
