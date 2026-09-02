-- Render mermaid code blocks in markdown as ASCII/Unicode art, so diagrams
-- are visible when opening READMEs.
-- Engine is bundled (pure TS, runs via node); re-renders automatically on
-- BufEnter and after edits (deounced).
-- Commands: :MermaidRender (toggle), :MermaidRenderAll, :MermaidClear,
--           :MermaidMode {inline|replace|hybrid|readonly}, :MermaidStyle {ascii|unicode}
return {
  {
    "kais-radwan/ascii-mermaid",
    ft = "markdown",
    opts = {
      auto = true,
      -- "inline" draws the diagram as virtual lines below the code block,
      -- leaving the source visible so the README stays readable.
      display_mode = "inline",
    },
  },
  {
    -- render-markdown conceals the closing fence of code blocks
    -- (code.border = "hide" -> conceal_lines), which also hides the
    -- virt_lines diagram ascii-mermaid anchors to that fence. Exempt mermaid
    -- blocks so the diagram stays visible.
    "MeanderingProgrammer/render-markdown.nvim",
    optional = true,
    opts = {
      code = {
        disable = { "mermaid" },
      },
    },
  },
}
