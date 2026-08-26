return {
  -- One Dark (warmer) — navarasu/onedark.nvim.
  -- transparent preserves kitty background_blur passthrough.
  {
    "navarasu/onedark.nvim",
    lazy = false,
    priority = 1000,
    opts = {
      style = "warmer",
      transparent = true,
      term_colors = true,
      lualine = { transparent = true },
    },
  },

  -- Disable LazyVim's bundled tokyonight so it is fully uninstalled.
  { "folke/tokyonight.nvim", enabled = false },

  -- Set onedark as the active colorscheme.
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "onedark",
    },
  },
}
