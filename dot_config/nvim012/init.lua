-- Minimal Neovim 0.12 config using vim.pack.
-- Launch with: NVIM_APPNAME=nvim012 nvim

if vim.fn.has("nvim-0.12") ~= 1 then
  vim.notify("This config requires Neovim 0.12+", vim.log.levels.ERROR)
end

require("options")
require("keymaps")
require("plugins")

-- Experimental 0.12 UI (redesigned messages/cmdline). Opt-in.
pcall(function() require("vim._core.ui2").enable() end)
