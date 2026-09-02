-- Terraform support comes from the lang.terraform extra (lazyvim.json):
-- treesitter (terraform, hcl), terraformls, tflint, terraform_fmt, telescope pickers.
-- This file adds OpenTofu on top: filetype detection, tofu-ls, tofu fmt.
return {
  {
    "neovim/nvim-lspconfig",
    init = function()
      vim.filetype.add({
        extension = {
          -- Builtin .tf detection is a TinyFugue-vs-terraform heuristic that
          -- misdetects empty/new .tf files as ft 'tf' (no LSP/treesitter).
          tf = "terraform",
          tfvars = "terraform-vars",
          -- Neovim has no builtin detection for OpenTofu files.
          tofu = "opentofu",
        },
        pattern = { [".*%.tofu%.json"] = "opentofu" },
      })
      -- No dedicated opentofu treesitter parser; reuse the terraform grammar.
      vim.treesitter.language.register("terraform", { "opentofu", "opentofu-vars" })
    end,
    opts = {
      servers = {
        -- lspconfig's tofu_ls also claims the terraform ft; restrict it so
        -- terraform buffers only get terraformls (from the extra).
        tofu_ls = { filetypes = { "opentofu", "opentofu-vars" } },
      },
    },
  },
  {
    "stevearc/conform.nvim",
    opts = {
      formatters_by_ft = {
        opentofu = { "tofu_fmt" },
        ["opentofu-vars"] = { "tofu_fmt" },
      },
    },
  },
  {
    "mason-org/mason.nvim",
    opts = function(_, opts)
      opts.ensure_installed = opts.ensure_installed or {}
      -- terraform-ls is normally auto-installed via mason-lspconfig, but pin it
      -- here too so headless/CLI installs don't depend on that trigger.
      vim.list_extend(opts.ensure_installed, { "tofu-ls", "terraform-ls" })
    end,
  },
}
