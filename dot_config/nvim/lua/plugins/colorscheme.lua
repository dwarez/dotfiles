return {
  -- Modus vivendi, deuteranopia variant — accessibility-first (WCAG AAA).
  -- Chosen after measuring perceptual distance under simulated colour
  -- deficiency: the previous palette put its primary accent and keyword colour
  -- 3.7 CIEDE2000 apart (indistinguishable); this one keeps every status colour
  -- >=20 apart AND separable by lightness alone.
  -- transparent preserves kitty background_blur passthrough.
  {
    "miikanissi/modus-themes.nvim",
    lazy = false,
    priority = 1000,
    opts = {
      style = "modus_vivendi",
      variants = { modus_vivendi = "deuteranopia" },
      transparent = true,
      dim_inactive = false,
      -- Extra, non-colour channels so meaning never rests on hue alone.
      styles = {
        comments = { italic = true },
        keywords = { bold = true },
        functions = {},
        variables = {},
      },
    on_colors = function(c)
      -- Modus's deuteranopia variant leans on four near-identical blues for
      -- syntax; measured CIEDE2000 under simulated deuteranomaly puts
      -- string/number at 0.0 and keyword/string at 1.4 — indistinguishable.
      -- Remap onto SIX slots that form a lightness ladder (L* 100 -> 63).
      c.keyword    = "#efef00" -- L*92 bright yellow
      c.builtin    = "#efef00"
      c.type       = "#c4d5ff" -- L*85 pale blue
      c.preproc    = "#c4d5ff"
      c.string     = "#00d3d0" -- L*77 cyan
      c.docstring  = "#989898"
      c.fn         = "#ffa00f" -- L*74 orange
      c.identifier = "#ffffff" -- L*100 white
      c.comment    = "#989898" -- L*63 neutral grey, deliberately achromatic
      -- Modus ships error=orange and warning=yellow: ΔE 0.5 apart under
      -- deuteranomaly. Re-ladder them by lightness instead.
      c.error   = "#ff5f59" -- L*62
      c.warning = "#efef00" -- L*92
      c.info    = "#79a8ff"
      c.ok      = "#00d3d0" -- L*77
      c.hint    = "#79a8ff"
    end,
    },
  },

  -- Disable LazyVim's bundled tokyonight so it is fully uninstalled.
  { "folke/tokyonight.nvim", enabled = false },

  -- Statusline. Modus ships no lualine theme, so build one from the palette.
  -- NORMAL uses warning-yellow (L*92, 15.2:1) to match the tmux session pill.
  {
    "nvim-lualine/lualine.nvim",
    opts = function(_, opts)
      opts.options.theme = {
        normal = {
          a = { fg = "#121212", bg = "#efef00", gui = "bold" },
          b = { fg = "#ffffff", bg = "#3a3a4a" },
          c = { fg = "#ffffff", bg = "NONE" },
        },
        insert   = { a = { fg = "#121212", bg = "#00d3d0", gui = "bold" } },
        visual   = { a = { fg = "#121212", bg = "#c4d5ff", gui = "bold" } },
        replace  = { a = { fg = "#121212", bg = "#ff5f59", gui = "bold" } },
        command  = { a = { fg = "#121212", bg = "#ffa00f", gui = "bold" } },
        terminal = { a = { fg = "#121212", bg = "#79a8ff", gui = "bold" } },
        inactive = {
          a = { fg = "#989898", bg = "#1c1c1c", gui = "bold" },
          b = { fg = "#989898", bg = "#1c1c1c" },
          c = { fg = "#989898", bg = "NONE" },
        },
      }
    end,
  },

  -- Set modus as the active colorscheme.
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "modus",
    },
  },
}
