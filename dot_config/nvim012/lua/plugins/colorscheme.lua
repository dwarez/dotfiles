require("kanagawa").setup({
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
})

vim.cmd.colorscheme("kanagawa-dragon")
