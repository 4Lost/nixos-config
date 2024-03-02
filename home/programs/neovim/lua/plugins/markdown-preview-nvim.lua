return {
  {
    "iamcco/markdown-preview.nvim",
    cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
    ft = { "markdown" },
    config = function()
      vim.g.mkdp_theme = "dark"
      vim.g.mkdp_echo_preview_url = 1
      vim.g.mkdp_browser = "luakit"
    end,
  },
}
