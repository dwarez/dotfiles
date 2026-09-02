-- Snacks picker: search inside dot-folders, but skip noise dirs.
-- `.git`/`.bare` are already excluded by the grep source itself.
local exclude = {
  "node_modules",
  "__pycache__",
  ".venv",
  ".mypy_cache",
  ".pytest_cache",
  ".ruff_cache",
  ".next",
  "dist",
  "target",
}

return {
  "folke/snacks.nvim",
  -- LazyVim's snacks_picker extra binds <leader>gd to Snacks.picker.git_diff (hunks);
  -- disable it so diffview.lua owns <leader>gd everywhere (not just the dashboard).
  keys = {
    { "<leader>gd", false },
  },
  opts = {
    picker = {
      sources = {
        -- ignored = true searches .gitignore'd paths too; exclude list keeps the noise out
        grep = { hidden = true, ignored = true, exclude = exclude },
        files = { hidden = true, ignored = true, exclude = exclude },
        -- Explorer (<leader>e): show everything, including dotfiles and gitignored paths.
        -- No exclude list here: the point is seeing what's on disk.
        explorer = { hidden = true, ignored = true, exclude = { ".git" } },
      },
    },
  },
}
