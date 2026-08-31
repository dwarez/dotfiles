-- Statusline built from the Vesper palette. vesper.nvim's own lualine theme
-- reuses one colour for command/terminal/visual, so the mode table is explicit.
require("lualine").setup({
  options = {
    theme = {
      normal = {
        a = { fg = "#101010", bg = "#ffc799", gui = "bold" },
        b = { fg = "#ffffff", bg = "#343434" },
        c = { fg = "#ffffff", bg = "#161616" },
      },
      insert   = { a = { fg = "#101010", bg = "#99ffe4", gui = "bold" } },
      visual   = { a = { fg = "#101010", bg = "#66cbb2", gui = "bold" } },
      replace  = { a = { fg = "#101010", bg = "#ff8080", gui = "bold" } },
      command  = { a = { fg = "#101010", bg = "#a0a0a0", gui = "bold" } },
      terminal = { a = { fg = "#101010", bg = "#74828d", gui = "bold" } },
      inactive = {
        a = { fg = "#707070", bg = "#161616", gui = "bold" },
        b = { fg = "#707070", bg = "#161616" },
        c = { fg = "#707070", bg = "#161616" },
      },
    },
    globalstatus = true,
    section_separators = "",
    component_separators = "",
  },
})
