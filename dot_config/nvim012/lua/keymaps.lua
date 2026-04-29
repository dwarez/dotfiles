local map = vim.keymap.set

-- ======================================================================
-- Basics
-- ======================================================================
map("n", "<Esc>", "<cmd>nohlsearch<cr>", { desc = "Clear search highlight" })
map({ "i", "x", "n", "s" }, "<C-s>", "<cmd>w<cr><esc>", { desc = "Save" })
map("n", "<leader>w", "<cmd>write<cr>", { desc = "Save" })

-- Better up/down on wrapped lines
map({ "n", "x" }, "j", "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })
map({ "n", "x" }, "k", "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })

-- Keep cursor centered
map("n", "<C-d>", "<C-d>zz")
map("n", "<C-u>", "<C-u>zz")
map("n", "n", "nzzzv")
map("n", "N", "Nzzzv")

-- Move lines
map("n", "<A-j>", "<cmd>m .+1<cr>==",    { desc = "Move down" })
map("n", "<A-k>", "<cmd>m .-2<cr>==",    { desc = "Move up" })
map("i", "<A-j>", "<esc><cmd>m .+1<cr>==gi", { desc = "Move down" })
map("i", "<A-k>", "<esc><cmd>m .-2<cr>==gi", { desc = "Move up" })
map("v", "<A-j>", ":m '>+1<cr>gv=gv",    { desc = "Move down" })
map("v", "<A-k>", ":m '<-2<cr>gv=gv",    { desc = "Move up" })
map("v", "J",     ":m '>+1<cr>gv=gv",    { desc = "Move down" })
map("v", "K",     ":m '<-2<cr>gv=gv",    { desc = "Move up" })

-- Keep visual mode after indenting
map("v", "<", "<gv")
map("v", ">", ">gv")

-- ======================================================================
-- Windows
-- ======================================================================
map("n", "<C-h>", "<C-w>h", { desc = "Left window" })
map("n", "<C-j>", "<C-w>j", { desc = "Down window" })
map("n", "<C-k>", "<C-w>k", { desc = "Up window" })
map("n", "<C-l>", "<C-w>l", { desc = "Right window" })

map("n", "<C-Up>",    "<cmd>resize +2<cr>",          { desc = "Increase height" })
map("n", "<C-Down>",  "<cmd>resize -2<cr>",          { desc = "Decrease height" })
map("n", "<C-Left>",  "<cmd>vertical resize -2<cr>", { desc = "Decrease width" })
map("n", "<C-Right>", "<cmd>vertical resize +2<cr>", { desc = "Increase width" })

map("n", "<leader>ww", "<C-W>p",    { desc = "Other window" })
map("n", "<leader>wd", "<C-W>c",    { desc = "Delete window" })
map("n", "<leader>w-", "<C-W>s",    { desc = "Split below" })
map("n", "<leader>w|", "<C-W>v",    { desc = "Split right" })
map("n", "<leader>-",  "<C-W>s",    { desc = "Split below" })
map("n", "<leader>|",  "<C-W>v",    { desc = "Split right" })

-- ======================================================================
-- Buffers
-- ======================================================================
map("n", "<S-h>",      "<cmd>bprevious<cr>",   { desc = "Prev buffer" })
map("n", "<S-l>",      "<cmd>bnext<cr>",       { desc = "Next buffer" })
map("n", "[b",         "<cmd>bprevious<cr>",   { desc = "Prev buffer" })
map("n", "]b",         "<cmd>bnext<cr>",       { desc = "Next buffer" })
map("n", "<leader>bb", "<cmd>e #<cr>",         { desc = "Switch to other buffer" })
map("n", "<leader>`",  "<cmd>e #<cr>",         { desc = "Switch to other buffer" })
map("n", "<leader>bd", "<cmd>bdelete<cr>",     { desc = "Delete buffer" })
map("n", "<leader>bD", "<cmd>bdelete!<cr>",    { desc = "Delete buffer (force)" })
map("n", "<leader>bo", function()
  local cur = vim.api.nvim_get_current_buf()
  for _, b in ipairs(vim.api.nvim_list_bufs()) do
    if b ~= cur and vim.bo[b].buflisted then pcall(vim.api.nvim_buf_delete, b, {}) end
  end
end, { desc = "Delete other buffers" })
map("n", "<leader>bl", "<cmd>BufferLineCloseRight<cr>", { desc = "Delete buffers to the right" })
map("n", "<leader>bh", "<cmd>BufferLineCloseLeft<cr>",  { desc = "Delete buffers to the left" })
map("n", "<leader>bp", "<cmd>BufferLineTogglePin<cr>",  { desc = "Toggle pin" })
map("n", "<leader>bP", "<cmd>BufferLineGroupClose ungrouped<cr>", { desc = "Delete non-pinned buffers" })

-- ======================================================================
-- Tabs
-- ======================================================================
map("n", "<leader><tab>l", "<cmd>tablast<cr>",     { desc = "Last tab" })
map("n", "<leader><tab>f", "<cmd>tabfirst<cr>",    { desc = "First tab" })
map("n", "<leader><tab><tab>", "<cmd>tabnew<cr>",  { desc = "New tab" })
map("n", "<leader><tab>]", "<cmd>tabnext<cr>",     { desc = "Next tab" })
map("n", "<leader><tab>d", "<cmd>tabclose<cr>",    { desc = "Close tab" })
map("n", "<leader><tab>[", "<cmd>tabprevious<cr>", { desc = "Prev tab" })

-- ======================================================================
-- Quit / session
-- ======================================================================
map("n", "<leader>qq", "<cmd>qa<cr>",  { desc = "Quit all" })
map("n", "<leader>qQ", "<cmd>qa!<cr>", { desc = "Quit all (force)" })

-- ======================================================================
-- Diagnostics (more in plugins/lsp.lua on LspAttach)
-- ======================================================================
map("n", "]d", function() vim.diagnostic.jump({ count = 1 }) end,  { desc = "Next diagnostic" })
map("n", "[d", function() vim.diagnostic.jump({ count = -1 }) end, { desc = "Prev diagnostic" })
map("n", "]e", function() vim.diagnostic.jump({ count = 1,  severity = vim.diagnostic.severity.ERROR }) end, { desc = "Next error" })
map("n", "[e", function() vim.diagnostic.jump({ count = -1, severity = vim.diagnostic.severity.ERROR }) end, { desc = "Prev error" })
map("n", "]w", function() vim.diagnostic.jump({ count = 1,  severity = vim.diagnostic.severity.WARN }) end,  { desc = "Next warning" })
map("n", "[w", function() vim.diagnostic.jump({ count = -1, severity = vim.diagnostic.severity.WARN }) end,  { desc = "Prev warning" })
map("n", "<leader>cd", vim.diagnostic.open_float, { desc = "Line diagnostics" })

-- ======================================================================
-- UI toggles
-- ======================================================================
map("n", "<leader>ul", function() vim.wo.number = not vim.wo.number end, { desc = "Toggle line numbers" })
map("n", "<leader>uL", function() vim.wo.relativenumber = not vim.wo.relativenumber end, { desc = "Toggle relative numbers" })
map("n", "<leader>uw", function() vim.wo.wrap = not vim.wo.wrap end,   { desc = "Toggle wrap" })
map("n", "<leader>us", function() vim.wo.spell = not vim.wo.spell end, { desc = "Toggle spell" })
map("n", "<leader>uh", function() vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled()) end, { desc = "Toggle inlay hints" })
map("n", "<leader>un", function() require("snacks").notifier.hide() end, { desc = "Dismiss notifications" })

-- ======================================================================
-- Lazygit / terminal (via snacks)
-- ======================================================================
map("n", "<leader>gg", function() require("snacks").lazygit() end,          { desc = "Lazygit" })
map("n", "<leader>gf", function() require("snacks").lazygit.log_file() end, { desc = "Lazygit (file history)" })
map("n", "<leader>gl", function() require("snacks").lazygit.log() end,      { desc = "Lazygit log" })
map("n", "<C-/>",      function() require("snacks").terminal() end,         { desc = "Terminal" })
map("n", "<leader>ft", function() require("snacks").terminal() end,         { desc = "Terminal" })

-- ======================================================================
-- Plugin manager (vim.pack)
-- ======================================================================
map("n", "<leader>pu", function() vim.pack.update() end,             { desc = "Update plugins" })
map("n", "<leader>pl", function() vim.print(vim.pack.get()) end,     { desc = "List plugins" })
