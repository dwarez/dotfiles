-- Dracula — official palette. See ~/.config/nvim/lua/plugins/colorscheme.lua
-- for why roles are reassigned (official Dracula puts functions in green and
-- strings in yellow, which measure 3.6 CIEDE2000 apart under simulated
-- deuteranomaly and appear side by side constantly).
require("dracula").setup({
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
})

vim.cmd.colorscheme("dracula")
