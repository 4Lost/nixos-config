return {
  {
    "folke/which-key.nvim",
    optional = true,
    event = "VeryLazy",
    init = function()
        vim.o.timeout = true
        vim.o.timeoutlen = 300
      end,
    opts = {
      defaults = {
        ["<localLeader>l"] = { name = "+vimtex" },
      },
    },
  },
}
