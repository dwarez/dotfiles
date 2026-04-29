require("todo-comments").setup({})

local map = vim.keymap.set
map("n", "]t", function() require("todo-comments").jump_next() end, { desc = "Next todo" })
map("n", "[t", function() require("todo-comments").jump_prev() end, { desc = "Prev todo" })
map("n", "<leader>st", "<cmd>TodoTelescope<cr>", { desc = "Todo (Telescope)" })
