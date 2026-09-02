return {
  {
    "LazyVim/LazyVim",
    opts = {
      autoformat = false,
    },
  },
  {
    "stevearc/conform.nvim",
    opts = {
      format_on_save = false,
      formatters_by_ft = {
        -- ty has no formatter; use the ruff CLI (mason) without the ruff LSP.
        python = { "ruff_format", "ruff_organize_imports" },
      },
    },
  },
  {
    "mason-org/mason.nvim",
    opts = function(_, opts)
      opts.ensure_installed = opts.ensure_installed or {}
      vim.list_extend(opts.ensure_installed, { "ruff" })
    end,
  },
}
