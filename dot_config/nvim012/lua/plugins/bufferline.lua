require("bufferline").setup({
  options = {
    mode = "buffers",
    diagnostics = "nvim_lsp",
    always_show_bufferline = true,
    offsets = {
      { filetype = "neo-tree", text = "Explorer", highlight = "Directory", text_align = "left" },
    },
    show_buffer_close_icons = true,
    show_close_icon = false,
  },
})

-- make sure hidden buffers stay listed — you can flip between them freely
vim.opt.hidden = true
