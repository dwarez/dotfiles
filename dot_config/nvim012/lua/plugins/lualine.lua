-- Statusline theme, built from onedark's warmer palette.
--
-- Two reasons this is explicit rather than `theme = "onedark"`:
--   1. lualine.nvim bundles its OWN lua/lualine/themes/onedark.lua (standard
--      One Dark: bg #282c34, green #98c379) and sits earlier in runtimepath,
--      so a plain require would silently pick the non-warmer palette.
--   2. onedark.nvim's bundled lualine theme paints NORMAL mode green, the only
--      green accent in an otherwise blue stack (tmux session/window pills,
--      kitty active tab, starship OS band, pane borders). Normal mode is blue
--      here so the statusline reads as part of the same theme.
--
-- Requires plugins.colorscheme to have run first (plugins.lua orders it that
-- way) so that onedark.colors resolves the warmer palette.
local c = require("onedark.colors")

require("lualine").setup({
  options = {
    theme = {
      normal = {
        a = { fg = c.bg0, bg = c.blue, gui = "bold" },
        b = { fg = c.fg, bg = c.bg3 },
        c = { fg = c.fg, bg = c.bg1 },
      },
      insert = { a = { fg = c.bg0, bg = c.green, gui = "bold" } },
      visual = { a = { fg = c.bg0, bg = c.purple, gui = "bold" } },
      replace = { a = { fg = c.bg0, bg = c.red, gui = "bold" } },
      command = { a = { fg = c.bg0, bg = c.yellow, gui = "bold" } },
      terminal = { a = { fg = c.bg0, bg = c.cyan, gui = "bold" } },
      inactive = {
        a = { fg = c.grey, bg = c.bg1, gui = "bold" },
        b = { fg = c.grey, bg = c.bg1 },
        c = { fg = c.grey, bg = c.bg1 },
      },
    },
    globalstatus = true,
    section_separators = "",
    component_separators = "",
  },
})
