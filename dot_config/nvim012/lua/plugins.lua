-- All plugin installs in one vim.pack.add call (nvim 0.12 built-in manager).
-- No lazy-loading: vim.pack does not support it.

vim.pack.add({
  -- Colorscheme
  { src = "https://github.com/rebelot/kanagawa.nvim" },

  -- Treesitter (main branch: full rewrite for nvim 0.12)
  { src = "https://github.com/nvim-treesitter/nvim-treesitter", version = "main" },

  -- LSP
  { src = "https://github.com/neovim/nvim-lspconfig" },
  { src = "https://github.com/folke/lazydev.nvim" },

  -- Completion
  { src = "https://github.com/saghen/blink.cmp", version = vim.version.range("*") },

  -- Snacks (claudecode dep + bigfile/notifier/input/terminal)
  { src = "https://github.com/folke/snacks.nvim" },

  -- Claude Code
  { src = "https://github.com/coder/claudecode.nvim" },

  -- UI
  { src = "https://github.com/nvim-lualine/lualine.nvim" },
  { src = "https://github.com/akinsho/bufferline.nvim" },
  { src = "https://github.com/nvim-tree/nvim-web-devicons" },
  { src = "https://github.com/folke/which-key.nvim" },

  -- File explorer (neo-tree + deps)
  { src = "https://github.com/nvim-lua/plenary.nvim" },
  { src = "https://github.com/MunifTanjim/nui.nvim" },
  { src = "https://github.com/nvim-neo-tree/neo-tree.nvim" },

  -- Telescope
  { src = "https://github.com/nvim-telescope/telescope.nvim" },
  { src = "https://github.com/nvim-telescope/telescope-fzf-native.nvim" },

  -- Editing helpers
  { src = "https://github.com/echasnovski/mini.nvim" },
  { src = "https://github.com/folke/flash.nvim" },

  -- Git
  { src = "https://github.com/lewis6991/gitsigns.nvim" },

  -- Diagnostics / TODO
  { src = "https://github.com/folke/trouble.nvim" },
  { src = "https://github.com/folke/todo-comments.nvim" },

  -- Formatter
  { src = "https://github.com/stevearc/conform.nvim" },

  -- Python venv selector
  { src = "https://github.com/linux-cultist/venv-selector.nvim" },
})

-- Configure each plugin
require("plugins.colorscheme")
require("plugins.treesitter")
require("plugins.lazydev")
require("plugins.lsp")
require("plugins.blink")
require("plugins.snacks")
require("plugins.claudecode")
require("plugins.lualine")
require("plugins.bufferline")
require("plugins.neotree")
require("plugins.whichkey")
require("plugins.telescope")
require("plugins.mini")
require("plugins.flash")
require("plugins.gitsigns")
require("plugins.trouble")
require("plugins.todo")
require("plugins.conform")
require("plugins.venv")
