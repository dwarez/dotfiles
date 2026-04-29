-- nvim-treesitter main branch (rewrite for nvim 0.12).
-- Requires tree-sitter CLI (>= 0.26) and a C compiler on PATH.

local ensure_installed = {
  "bash",
  "c",
  "html",
  "javascript",
  "json",
  "lua",
  "luadoc",
  "markdown",
  "markdown_inline",
  "ninja",
  "python",
  "query",
  "regex",
  "rst",
  "toml",
  "tsx",
  "typescript",
  "vim",
  "vimdoc",
  "yaml",
}

local ok, ts = pcall(require, "nvim-treesitter")
if not ok then
  vim.notify("nvim-treesitter not available yet (first install)", vim.log.levels.WARN)
  return
end

local installed = require("nvim-treesitter.config").get_installed()
local to_install = vim.iter(ensure_installed)
  :filter(function(p) return not vim.tbl_contains(installed, p) end)
  :totable()

if #to_install > 0 then
  ts.install(to_install)
end

-- Enable highlight + tree-sitter indent per filetype.
vim.api.nvim_create_autocmd("FileType", {
  group = vim.api.nvim_create_augroup("ts-start", { clear = true }),
  callback = function(args)
    local lang = vim.treesitter.language.get_lang(vim.bo[args.buf].filetype)
    if lang and vim.treesitter.language.add(lang) then
      pcall(vim.treesitter.start, args.buf, lang)
      vim.bo[args.buf].indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
    end
  end,
})
