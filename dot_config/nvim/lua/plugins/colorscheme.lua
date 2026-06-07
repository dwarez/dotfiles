return {
  -- One Dark Pro — the active colorscheme (crisp, well-saturated, distinct hues).
  {
    "olimorris/onedarkpro.nvim",
    lazy = false,
    priority = 1000,
    opts = {
      options = {
        transparency = true, -- let kitty's translucent/blurred background show through
      },
    },
  },

  -- Kanagawa stays installed and configured but is NOT applied automatically.
  -- Switch any time with:  :colorscheme kanagawa-dragon
  {
    "rebelot/kanagawa.nvim",
    lazy = false,
    priority = 999,
    opts = {
      compile = true,
      undercurl = true,
      commentStyle = { italic = true },
      keywordStyle = { italic = true },
      statementStyle = { bold = true },
      terminalColors = true,
      theme = "dragon",
      background = {
        dark = "dragon",
        light = "lotus",
      },
    },
    config = function(_, opts)
      require("kanagawa").setup(opts)
    end,
  },

  -- Use One Dark Pro as the active colorscheme.
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "onedark",
    },
  },
}
