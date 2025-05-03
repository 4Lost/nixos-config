return {
  {
    "JoosepAlviste/nvim-ts-context-commentstring",
    dependencies = {
      {
        "numToStr/Comment.nvim",
        name = "comment.nvim",
        lazy = false,
        config = function()
          require("Comment").setup({
            pre_hook = function()
              return vim.bo.commentstring
            end,
          })
        end,
      },
      "nvim-treesitter/nvim-treesitter",
    },
  },
}
