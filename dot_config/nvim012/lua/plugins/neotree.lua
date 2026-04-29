require("neo-tree").setup({
  close_if_last_window = true,
  filesystem = {
    follow_current_file = { enabled = true },
    use_libuv_file_watcher = true,
    hijack_netrw_behavior = "open_current",
    filtered_items = {
      visible = false,
      hide_dotfiles = false,
      hide_gitignored = true,
    },
  },
  window = {
    width = 32,
    mappings = {
      ["<space>"] = "none",
    },
  },
  default_component_configs = {
    indent = { with_markers = true, with_expanders = true },
    git_status = { symbols = { added = "+", modified = "~", deleted = "-", renamed = "→" } },
  },
})

vim.keymap.set("n", "<leader>e", "<cmd>Neotree toggle<cr>",       { desc = "Explorer (toggle)" })
vim.keymap.set("n", "<leader>E", "<cmd>Neotree focus<cr>",        { desc = "Explorer (focus)" })
vim.keymap.set("n", "<leader>fe", "<cmd>Neotree reveal<cr>",      { desc = "Explorer (reveal file)" })
