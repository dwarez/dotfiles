-- Statusline built from the Modus (deuteranopia) palette.
-- Modus ships no lualine theme, so the mode table is explicit. NORMAL uses
-- warning-yellow (L*92, 15.2:1) to match the tmux session pill; modes are
-- spread across the palette's lightness ladder rather than by hue alone.
require("lualine").setup({
  options = {
    theme = {
      normal = {
        a = { fg = "#121212", bg = "#efef00", gui = "bold" },
        b = { fg = "#ffffff", bg = "#3a3a4a" },
        c = { fg = "#ffffff", bg = "#1c1c1c" },
      },
      insert   = { a = { fg = "#121212", bg = "#00d3d0", gui = "bold" } },
      visual   = { a = { fg = "#121212", bg = "#c4d5ff", gui = "bold" } },
      replace  = { a = { fg = "#121212", bg = "#ff5f59", gui = "bold" } },
      command  = { a = { fg = "#121212", bg = "#ffa00f", gui = "bold" } },
      terminal = { a = { fg = "#121212", bg = "#79a8ff", gui = "bold" } },
      inactive = {
        a = { fg = "#989898", bg = "#1c1c1c", gui = "bold" },
        b = { fg = "#989898", bg = "#1c1c1c" },
        c = { fg = "#989898", bg = "#1c1c1c" },
      },
    },
    globalstatus = true,
    section_separators = "",
    component_separators = "",
  },
})
