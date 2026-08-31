require("onedark").setup({
  style = "warmer",
  term_colors = true,
  code_style = {
    comments = "italic",
    keywords = "italic",
  },
  lualine = { transparent = false },
})

vim.cmd.colorscheme("onedark")
