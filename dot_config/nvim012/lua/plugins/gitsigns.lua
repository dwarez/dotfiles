require("gitsigns").setup({
  signs = {
    add          = { text = "▎" },
    change       = { text = "▎" },
    delete       = { text = "" },
    topdelete    = { text = "" },
    changedelete = { text = "▎" },
    untracked    = { text = "▎" },
  },
  on_attach = function(buf)
    local gs = require("gitsigns")
    local map = function(l, r, desc) vim.keymap.set("n", l, r, { buffer = buf, desc = desc }) end
    map("]h", function() gs.nav_hunk("next") end, "Next hunk")
    map("[h", function() gs.nav_hunk("prev") end, "Prev hunk")
    map("<leader>gs", gs.stage_hunk,           "Stage hunk")
    map("<leader>gr", gs.reset_hunk,           "Reset hunk")
    map("<leader>gS", gs.stage_buffer,         "Stage buffer")
    map("<leader>gp", gs.preview_hunk,         "Preview hunk")
    map("<leader>gb", function() gs.blame_line({ full = true }) end, "Blame line")
    map("<leader>gd", gs.diffthis,             "Diff this")
  end,
})
