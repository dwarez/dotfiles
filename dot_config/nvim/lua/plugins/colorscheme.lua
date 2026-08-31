return {
  -- Dracula — official palette, chosen by measurement. Of every candidate it
  -- has the highest chroma (mean C* 54.8 across the syntax accents, +64% over
  -- the previous theme) on a mid-dark #282a36 background (L*17.3 vs the
  -- previous L*4.7), which is what makes each role readable at a glance.
  -- transparent_bg preserves kitty background_blur passthrough.
  {
    "Mofiqul/dracula.nvim",
    lazy = false,
    priority = 1000,
    opts = {
      transparent_bg = true,
      italic_comment = true,
      show_end_of_buffer = false,
      -- Official Dracula paints functions GREEN and strings YELLOW. Those two
      -- measure 3.6 CIEDE2000 apart under simulated deuteranomaly and sit side
      -- by side in every function call, so roles are reassigned onto the six
      -- accents that are mutually safe (min 8.4). Green is the only confusable
      -- colour in the palette -- 3.2 vs orange, 3.6 vs yellow, 7.3 vs cyan --
      -- so it is reserved for diff-added, where its partners are red (14.7) and
      -- purple (39.7). Every colour below is an untouched official Dracula hex.
      overrides = function(c)
        return {
          -- variables / identifiers: plain foreground
          Identifier   = { fg = c.fg },
          ["@variable"] = { fg = c.fg },
          -- keyword: pink
          Keyword      = { fg = c.pink, italic = true },
          Statement    = { fg = c.pink },
          ["@keyword"] = { fg = c.pink, italic = true },
          -- function: cyan (NOT green)
          Function     = { fg = c.cyan },
          ["@function"] = { fg = c.cyan },
          ["@function.call"] = { fg = c.cyan },
          ["@method"]  = { fg = c.cyan },
          -- string: yellow
          String       = { fg = c.yellow },
          ["@string"]  = { fg = c.yellow },
          -- type / class: purple
          Type         = { fg = c.purple },
          ["@type"]    = { fg = c.purple },
          StorageClass = { fg = c.purple },
          -- number / boolean / constant: red
          Number       = { fg = c.red },
          Boolean      = { fg = c.red },
          Constant     = { fg = c.red },
          ["@number"]  = { fg = c.red },
          ["@boolean"] = { fg = c.red },
          ["@constant"] = { fg = c.red },
          -- parameter / property: orange
          ["@parameter"] = { fg = c.orange },
          ["@variable.parameter"] = { fg = c.orange },
          ["@property"] = { fg = c.orange },
          ["@field"]   = { fg = c.orange },
          -- diff: green is safe here (partners red and purple)
          Added        = { fg = c.green },
          Removed      = { fg = c.red },
          Changed      = { fg = c.purple },
          DiffAdd      = { fg = c.green },
          DiffDelete   = { fg = c.red },
          DiffChange   = { fg = c.purple },
          -- diagnostics: cyan / yellow / red trio, 20.9 apart at worst
          DiagnosticOk    = { fg = c.cyan },
          DiagnosticWarn  = { fg = c.yellow },
          DiagnosticError = { fg = c.red },
          DiagnosticInfo  = { fg = c.cyan },
          DiagnosticHint  = { fg = c.purple },
        }
      end,
    },
  },

  -- Disable LazyVim's bundled tokyonight so it is fully uninstalled.
  { "folke/tokyonight.nvim", enabled = false },

  -- Statusline. NOTE: lualine bundles its own lua/lualine/themes/dracula.lua,
  -- so `theme = "dracula"` would silently pick that one rather than the
  -- plugin's. The mode table is explicit to avoid the ambiguity entirely and to
  -- match the tmux pills.
  {
    "nvim-lualine/lualine.nvim",
    opts = function(_, opts)
      opts.options.theme = {
        normal = {
          a = { fg = "#282a36", bg = "#bd93f9", gui = "bold" },
          b = { fg = "#f8f8f2", bg = "#44475a" },
          c = { fg = "#f8f8f2", bg = "NONE" },
        },
        insert   = { a = { fg = "#282a36", bg = "#8be9fd", gui = "bold" } },
        visual   = { a = { fg = "#282a36", bg = "#ff79c6", gui = "bold" } },
        replace  = { a = { fg = "#282a36", bg = "#ff5555", gui = "bold" } },
        command  = { a = { fg = "#282a36", bg = "#f1fa8c", gui = "bold" } },
        terminal = { a = { fg = "#282a36", bg = "#ffb86c", gui = "bold" } },
        inactive = {
          a = { fg = "#6272a4", bg = "#21222c", gui = "bold" },
          b = { fg = "#6272a4", bg = "#21222c" },
          c = { fg = "#6272a4", bg = "NONE" },
        },
      }
    end,
  },

  -- Set dracula as the active colorscheme.
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "dracula",
    },
  },
}
