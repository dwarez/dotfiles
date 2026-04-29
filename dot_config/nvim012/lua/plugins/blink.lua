require("blink.cmp").setup({
  keymap = {
    preset = "none",

    ["<Tab>"]   = { "select_next", "snippet_forward", "fallback" },
    ["<S-Tab>"] = { "select_prev", "snippet_backward", "fallback" },

    ["<Up>"]   = { "select_prev", "fallback" },
    ["<Down>"] = { "select_next", "fallback" },

    ["<C-space>"] = { "show", "show_documentation", "hide_documentation" },
    ["<C-e>"]     = { "hide", "fallback" },

    ["<CR>"] = { "accept", "fallback" },

    ["<C-u>"] = { "scroll_documentation_up", "fallback" },
    ["<C-d>"] = { "scroll_documentation_down", "fallback" },
  },

  completion = {
    menu = {
      auto_show = function(ctx)
        return ctx.mode ~= "cmdline" and vim.bo.buftype ~= "prompt"
      end,
    },
    ghost_text = { enabled = false },
    list = {
      selection = { preselect = false, auto_insert = false },
    },
  },
})

-- Advertise blink's completion capabilities to LSP servers.
local caps = vim.lsp.protocol.make_client_capabilities()
local ok, blink = pcall(require, "blink.cmp")
if ok and blink.get_lsp_capabilities then
  caps = blink.get_lsp_capabilities(caps)
end
vim.lsp.config("*", { capabilities = caps })
