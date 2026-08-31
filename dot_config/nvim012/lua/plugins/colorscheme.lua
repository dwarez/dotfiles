-- Modus vivendi, deuteranopia variant — accessibility-first (WCAG AAA).
-- See ~/.config/nvim/lua/plugins/colorscheme.lua for the measurement rationale
-- behind the on_colors remap: Modus's stock syntax palette puts string/number
-- 0.0 CIEDE2000 apart under simulated deuteranomaly.
require("modus-themes").setup({
  style = "modus_vivendi",
  variants = { modus_vivendi = "deuteranopia" },
  dim_inactive = false,
  styles = {
    comments = { italic = true },
    keywords = { bold = true },
  },
    on_colors = function(c)
      -- Modus's deuteranopia variant leans on four near-identical blues for
      -- syntax; measured CIEDE2000 under simulated deuteranomaly puts
      -- string/number at 0.0 and keyword/string at 1.4 — indistinguishable.
      -- Remap onto SIX slots that form a lightness ladder (L* 100 -> 63).
      c.keyword    = "#efef00" -- L*92 bright yellow
      c.builtin    = "#efef00"
      c.type       = "#c4d5ff" -- L*85 pale blue
      c.preproc    = "#c4d5ff"
      c.string     = "#00d3d0" -- L*77 cyan
      c.docstring  = "#989898"
      c.fn         = "#ffa00f" -- L*74 orange
      c.identifier = "#ffffff" -- L*100 white
      c.comment    = "#989898" -- L*63 neutral grey, deliberately achromatic
      -- Modus ships error=orange and warning=yellow: ΔE 0.5 apart under
      -- deuteranomaly. Re-ladder them by lightness instead.
      c.error   = "#ff5f59" -- L*62
      c.warning = "#efef00" -- L*92
      c.info    = "#79a8ff"
      c.ok      = "#00d3d0" -- L*77
      c.hint    = "#79a8ff"
    end,
})

vim.cmd.colorscheme("modus")
