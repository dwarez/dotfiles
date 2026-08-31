-- Vesper — minimal near-black (text 19.0:1). See
-- ~/.config/nvim/lua/plugins/colorscheme.lua for the selection rationale and
-- for why the overrides below are needed (stock Type/Function/@property all
-- measured 0.0 CIEDE2000 apart under simulated colour deficiency).
require("vesper").setup({
  italics = {
    comments = true,
    keywords = true,
    functions = false,
    strings = false,
    variables = false,
    bufferline = false,
  },
      -- vesper.nvim dims Normal to #cccccc (11.8:1). Vesper's own fg is #ffffff
      -- (19.0:1) and that contrast is the whole reason this palette was chosen,
      -- so it is restored. It also paints Type, Function and @property the same
      -- #ffcfa8 (measured 0.0 CIEDE2000 apart under simulated colour
      -- deficiency) — types/functions/fields were indistinguishable.
      --
      -- Result is a FIVE-colour syntax set, every pair >=11.5 CIEDE2000 apart.
      -- Five, not six, because measured capacity under simulation tops out
      -- there; a sixth slot drops the worst pair below 7.
      overrides = {
        Normal     = { fg = "#ffffff" },
        Identifier = { fg = "#ffffff" },
        Type       = { fg = "#ffffff" },
        Constant   = { fg = "#ffffff" },
        Number     = { fg = "#ffffff" },
        Statement  = { fg = "#ffc799" },
        Keyword    = { fg = "#ffc799", italic = true },
        PreProc    = { fg = "#ffc799" },
        Function   = { fg = "#82d9c2" },
        String     = { fg = "#8b99a5" },
        Comment    = { fg = "#7d7d7d", italic = true },
        Operator   = { fg = "#a0a0a0" },
        ["@variable"]  = { fg = "#ffffff" },
        ["@type"]      = { fg = "#ffffff" },
        ["@number"]    = { fg = "#ffffff" },
        ["@constant"]  = { fg = "#ffffff" },
        ["@property"]  = { fg = "#ffffff" },
        ["@keyword"]   = { fg = "#ffc799", italic = true },
        ["@function"]  = { fg = "#82d9c2" },
        ["@string"]    = { fg = "#8b99a5" },
        -- Diff SIGNS carry add/change/delete, not the background tints: the
        -- three canonical accents sit 21.6 / 14.2 / 10.0 apart, whereas any
        -- near-black background triple measured under 8.
        Added      = { fg = "#99ffe4" },
        Removed    = { fg = "#ff8080" },
        Changed    = { fg = "#ffc799" },
        DiffAdd    = { fg = "#99ffe4" },
        DiffDelete = { fg = "#ff8080" },
        DiffChange = { fg = "#ffc799" },
      },
})

vim.cmd.colorscheme("vesper")
