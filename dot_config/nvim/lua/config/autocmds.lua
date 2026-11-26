-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
--
-- Add any additional autocmds here
-- with `vim.api.nvim_create_autocmd`
--
-- Or remove existing autocmds by their group name (which is prefixed with `lazyvim_` for the defaults)
-- e.g. vim.api.nvim_del_augroup_by_name("lazyvim_wrap_spell")

vim.g.autoformat = false
vim.diagnostic.enable(false)

local function set_snacks_picker_highlights()
  vim.api.nvim_set_hl(0, "SnacksPickerListCursorLine", { link = "CursorLine" })
  vim.api.nvim_set_hl(0, "SnacksPickerPreviewCursorLine", { link = "CursorLine" })
end

vim.api.nvim_create_autocmd("ColorScheme", {
  group = vim.api.nvim_create_augroup("snacks_picker_highlights", { clear = true }),
  callback = set_snacks_picker_highlights,
})

set_snacks_picker_highlights()
