require("conform").setup({
  formatters_by_ft = {
    lua        = { "stylua" },
    python     = { "ruff_format", "ruff_organize_imports" },
    javascript = { "prettier" },
    typescript = { "prettier" },
    json       = { "prettier" },
    yaml       = { "prettier" },
    markdown   = { "prettier" },
  },
})

vim.keymap.set({ "n", "v" }, "<leader>cf", function()
  require("conform").format({ async = true, lsp_fallback = true })
end, { desc = "Format" })
