return {
  {
    "catppuccin/nvim",
    name = "catppuccin-nvim",
    priority = 1000,
    config = function()
      require("catppuccin").setup()
      vim.cmd.colorscheme("catppuccin-mocha")
    end,
    opts = {
      flavor = "mocha",
      integrations = {
        nvimtree = true,
        dashboard = true,
        which_key = true,
        cmp = true,
        markdown = true,
        leap = true,
        telescope = {
          enabled = true,
        },
        treesitter = true,
        rainbow_delimiters = true,
        dropbar = {
          enabled = false,
          color_mode = false, -- enable color for kind's texts, not just kind's icons
        },
        native_lsp = {
          enabled = true,
          virtual_text = {
            errors = { "italic" },
            hints = { "italic" },
            warnings = { "italic" },
            information = { "italic" },
          },
          underlines = {
            errors = { "underline" },
            hints = { "underline" },
            warnings = { "underline" },
            information = { "underline" },
          },
          inlay_hints = {
            background = true,
          },
        },
      },
    },
  },
}
