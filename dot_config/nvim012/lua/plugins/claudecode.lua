require("claudecode").setup({})

local map = vim.keymap.set
map("n", "<leader>ac", "<cmd>ClaudeCode<cr>",       { desc = "Toggle Claude Code" })
map("n", "<leader>af", "<cmd>ClaudeCodeFocus<cr>",  { desc = "Focus Claude Code" })
map("v", "<leader>as", "<cmd>ClaudeCodeSend<cr>",   { desc = "Send selection to Claude" })
