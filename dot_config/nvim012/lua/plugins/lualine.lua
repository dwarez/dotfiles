-- Statusline built from the official Dracula palette. lualine bundles its own
-- `dracula` theme which would shadow the plugin's, so the mode table is
-- explicit; it also matches the tmux pills.
require("lualine").setup({
  options = {
    theme = {
      normal = {
        a = { fg = "#282a36", bg = "#bd93f9", gui = "bold" },
        b = { fg = "#f8f8f2", bg = "#44475a" },
        c = { fg = "#f8f8f2", bg = "#21222c" },
      },
      insert   = { a = { fg = "#282a36", bg = "#8be9fd", gui = "bold" } },
      visual   = { a = { fg = "#282a36", bg = "#ff79c6", gui = "bold" } },
      replace  = { a = { fg = "#282a36", bg = "#ff5555", gui = "bold" } },
      command  = { a = { fg = "#282a36", bg = "#f1fa8c", gui = "bold" } },
      terminal = { a = { fg = "#282a36", bg = "#ffb86c", gui = "bold" } },
      inactive = {
        a = { fg = "#6272a4", bg = "#21222c", gui = "bold" },
        b = { fg = "#6272a4", bg = "#21222c" },
        c = { fg = "#6272a4", bg = "#21222c" },
      },
    },
    globalstatus = true,
    section_separators = "",
    component_separators = "",
  },
})
