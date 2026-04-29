local wk = require("which-key")
wk.setup({
  preset = "modern",
  delay = 200,
  icons = {
    mappings = true,
  },
})

wk.add({
  { "<leader>a",  group = "ai/claude" },
  { "<leader>b",  group = "buffer" },
  { "<leader>c",  group = "code" },
  { "<leader>f",  group = "file/find" },
  { "<leader>g",  group = "git" },
  { "<leader>gh", group = "hunks" },
  { "<leader>q",  group = "quit/session" },
  { "<leader>s",  group = "search" },
  { "<leader>t",  group = "tab" },
  { "<leader>u",  group = "ui/toggle" },
  { "<leader>w",  group = "window" },
  { "<leader>x",  group = "diagnostics/quickfix" },
  { "<leader>p",  group = "plugins" },
  { "<leader><tab>", group = "tabs" },
  { "[",          group = "prev" },
  { "]",          group = "next" },
  { "g",          group = "goto" },
  { "z",          group = "fold" },
})
