local telescope = require("telescope")
telescope.setup({
  defaults = {
    layout_strategy = "horizontal",
    layout_config = { prompt_position = "top" },
    sorting_strategy = "ascending",
    winblend = 0,
    path_display = { "truncate" },
  },
  extensions = {
    fzf = {
      fuzzy = true,
      override_generic_sorter = true,
      override_file_sorter = true,
      case_mode = "smart_case",
    },
  },
})

-- fzf-native extension needs `make` in the plugin dir. Attempt a build on first load.
pcall(function()
  local path = vim.fn.stdpath("data") .. "/site/pack/core/opt/telescope-fzf-native.nvim"
  if vim.fn.isdirectory(path) == 1 and vim.fn.filereadable(path .. "/build/libfzf.so") == 0 then
    vim.notify("Building telescope-fzf-native...", vim.log.levels.INFO)
    vim.fn.system({ "make", "-C", path })
  end
end)
pcall(telescope.load_extension, "fzf")

local b = require("telescope.builtin")
local map = vim.keymap.set
map("n", "<leader><space>", b.find_files,   { desc = "Find files" })
map("n", "<leader>ff",      b.find_files,   { desc = "Find files" })
map("n", "<leader>fg",      b.live_grep,    { desc = "Live grep" })
map("n", "<leader>fb",      b.buffers,      { desc = "Buffers" })
map("n", "<leader>fh",      b.help_tags,    { desc = "Help tags" })
map("n", "<leader>fr",      b.oldfiles,     { desc = "Recent files" })
map("n", "<leader>fc",      b.commands,     { desc = "Commands" })
map("n", "<leader>sg",      b.live_grep,    { desc = "Grep" })
map("n", "<leader>sw",      b.grep_string,  { desc = "Grep word under cursor" })
map("n", "<leader>sd",      b.diagnostics,  { desc = "Diagnostics" })
map("n", "<leader>sk",      b.keymaps,      { desc = "Keymaps" })
map("n", "<leader>sr",      b.resume,       { desc = "Resume" })
map("n", "<leader>sm",      b.marks,        { desc = "Marks" })
map("n", "<leader>sj",      b.jumplist,     { desc = "Jumplist" })
map("n", "<leader>sq",      b.quickfix,     { desc = "Quickfix" })
map("n", "<leader>sR",      b.registers,    { desc = "Registers" })
map("n", "<leader>ss",      b.lsp_document_symbols,          { desc = "Document symbols" })
map("n", "<leader>sS",      b.lsp_dynamic_workspace_symbols, { desc = "Workspace symbols" })

-- Git telescope pickers
map("n", "<leader>gc",      b.git_commits,  { desc = "Git commits" })
map("n", "<leader>gC",      b.git_bcommits, { desc = "Git commits (buffer)" })
map("n", "<leader>gB",      b.git_branches, { desc = "Git branches" })
map("n", "<leader>gst",     b.git_status,   { desc = "Git status" })
map("n", "<leader>gS",      b.git_stash,    { desc = "Git stash" })
