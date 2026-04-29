require("venv-selector").setup({
  name = { "venv", ".venv", "env", ".env" },
})

vim.keymap.set("n", "<leader>cv", "<cmd>VenvSelect<cr>",       { desc = "Select VirtualEnv" })
vim.keymap.set("n", "<leader>cV", "<cmd>VenvSelectCached<cr>", { desc = "Select cached VirtualEnv" })
