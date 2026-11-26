-- Make sure custom keymaps show up in the which-key popup with nice labels.
return {
  "folke/which-key.nvim",
  opts = {
    spec = {
      { "<leader>ue", desc = "Toggle Diagnostics (buffer)", icon = { icon = "", color = "yellow" } },
      { "<leader>a", group = "popagent", mode = { "n", "x" } },
    },
  },
}
