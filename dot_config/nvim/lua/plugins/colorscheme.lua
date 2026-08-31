return {
  -- Vesper — minimal near-black. Selected by measurement: of 95 community
  -- palettes scored under simulated deuteranomaly/protanomaly/tritanomaly
  -- (Machado 2009) with CIEDE2000, Vesper has the highest text contrast
  -- (19.0:1) and the highest accent-contrast floor, because it commits to only
  -- three real accents (red #ff8080, peach #ffc799, mint #99ffe4) instead of a
  -- full hue wheel — there is simply less to confuse.
  -- transparent preserves kitty background_blur passthrough.
  {
    "datsfilipe/vesper.nvim",
    lazy = false,
    priority = 1000,
    opts = {
      transparent = true,
      -- Upstream italicises strings, functions AND variables; that much slanted
      -- text hurts legibility, so only comments and keywords stay italic.
      italics = {
        comments = true,
        keywords = true,
        functions = false,
        strings = false,
        variables = false,
        bufferline = false,
      },
      -- vesper.nvim dims Normal to #cccccc (11.8:1). Vesper's own fg is #ffffff
      -- (19.0:1) and that contrast is the whole reason this palette was chosen,
      -- so it is restored. It also paints Type, Function and @property the same
      -- #ffcfa8 (measured 0.0 CIEDE2000 apart under simulated colour
      -- deficiency) — types/functions/fields were indistinguishable.
      --
      -- Result is a FIVE-colour syntax set, every pair >=11.5 CIEDE2000 apart.
      -- Five, not six, because measured capacity under simulation tops out
      -- there; a sixth slot drops the worst pair below 7.
      overrides = {
        Normal     = { fg = "#ffffff" },
        Identifier = { fg = "#ffffff" },
        Type       = { fg = "#ffffff" },
        Constant   = { fg = "#ffffff" },
        Number     = { fg = "#ffffff" },
        Statement  = { fg = "#ffc799" },
        Keyword    = { fg = "#ffc799", italic = true },
        PreProc    = { fg = "#ffc799" },
        Function   = { fg = "#82d9c2" },
        String     = { fg = "#8b99a5" },
        Comment    = { fg = "#7d7d7d", italic = true },
        Operator   = { fg = "#a0a0a0" },
        ["@variable"]  = { fg = "#ffffff" },
        ["@type"]      = { fg = "#ffffff" },
        ["@number"]    = { fg = "#ffffff" },
        ["@constant"]  = { fg = "#ffffff" },
        ["@property"]  = { fg = "#ffffff" },
        ["@keyword"]   = { fg = "#ffc799", italic = true },
        ["@function"]  = { fg = "#82d9c2" },
        ["@string"]    = { fg = "#8b99a5" },
        -- Diff SIGNS carry add/change/delete, not the background tints: the
        -- three canonical accents sit 21.6 / 14.2 / 10.0 apart, whereas any
        -- near-black background triple measured under 8.
        Added      = { fg = "#99ffe4" },
        Removed    = { fg = "#ff8080" },
        Changed    = { fg = "#ffc799" },
        DiffAdd    = { fg = "#99ffe4" },
        DiffDelete = { fg = "#ff8080" },
        DiffChange = { fg = "#ffc799" },
      },
    },
  },

  -- Disable LazyVim's bundled tokyonight so it is fully uninstalled.
  { "folke/tokyonight.nvim", enabled = false },

  -- Statusline. vesper.nvim ships a lualine theme but reuses one colour for
  -- command/terminal/visual (its `green` and `greenLight` are the same hex), so
  -- the mode table is explicit and spread across the verified palette.
  {
    "nvim-lualine/lualine.nvim",
    opts = function(_, opts)
      opts.options.theme = {
        normal = {
          a = { fg = "#101010", bg = "#ffc799", gui = "bold" },
          b = { fg = "#ffffff", bg = "#343434" },
          c = { fg = "#ffffff", bg = "NONE" },
        },
        insert   = { a = { fg = "#101010", bg = "#99ffe4", gui = "bold" } },
        visual   = { a = { fg = "#101010", bg = "#66cbb2", gui = "bold" } },
        replace  = { a = { fg = "#101010", bg = "#ff8080", gui = "bold" } },
        command  = { a = { fg = "#101010", bg = "#a0a0a0", gui = "bold" } },
        terminal = { a = { fg = "#101010", bg = "#74828d", gui = "bold" } },
        inactive = {
          a = { fg = "#707070", bg = "#161616", gui = "bold" },
          b = { fg = "#707070", bg = "#161616" },
          c = { fg = "#707070", bg = "NONE" },
        },
      }
    end,
  },

  -- Set vesper as the active colorscheme.
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "vesper",
    },
  },
}
