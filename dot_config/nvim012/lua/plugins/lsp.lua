-- LSP: uses nvim 0.12's native vim.lsp.config / vim.lsp.enable.
-- nvim-lspconfig is included purely for its ready-made configs in lsp/*.lua.
-- Servers must be installed on the system (e.g. pipx install pyright ruff,
-- and lua-language-server via your package manager).

local servers = { "lua_ls", "pyright", "ruff" }

-- Per-server overrides
vim.lsp.config("lua_ls", {
  settings = {
    Lua = {
      workspace = { checkThirdParty = false },
      telemetry = { enable = false },
      diagnostics = { globals = { "vim" } },
    },
  },
})

vim.lsp.config("pyright", {
  settings = {
    python = {
      analysis = {
        typeCheckingMode = "basic",
        autoSearchPaths = true,
        useLibraryCodeForTypes = true,
      },
    },
  },
})

-- Only enable servers whose binaries exist, to avoid startup errors.
local server_bin = {
  lua_ls = "lua-language-server",
  pyright = "pyright-langserver",
  ruff = "ruff",
}

local enabled = {}
for _, name in ipairs(servers) do
  if vim.fn.executable(server_bin[name]) == 1 then
    table.insert(enabled, name)
  end
end
if #enabled > 0 then
  vim.lsp.enable(enabled)
end

-- Diagnostics UI
vim.diagnostic.config({
  virtual_text = { spacing = 4, source = "if_many", prefix = "●" },
  severity_sort = true,
  signs = true,
  underline = true,
  update_in_insert = false,
  float = { border = "rounded", source = "if_many" },
})

-- Keymaps on LSP attach
vim.api.nvim_create_autocmd("LspAttach", {
  group = vim.api.nvim_create_augroup("user-lsp-attach", { clear = true }),
  callback = function(ev)
    local buf = ev.buf
    local function map(lhs, rhs, desc)
      vim.keymap.set("n", lhs, rhs, { buffer = buf, desc = desc })
    end
    map("gd", vim.lsp.buf.definition, "Go to definition")
    map("gD", vim.lsp.buf.declaration, "Go to declaration")
    map("gr", vim.lsp.buf.references, "References")
    map("gi", vim.lsp.buf.implementation, "Implementation")
    map("K", vim.lsp.buf.hover, "Hover")
    map("<leader>cr", vim.lsp.buf.rename, "Rename")
    map("<leader>ca", vim.lsp.buf.code_action, "Code action")
    map("<leader>cf", function() vim.lsp.buf.format({ async = true }) end, "Format")
  end,
})
