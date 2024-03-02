return {
  {
    "nvim-telescope/telescope-fzf-native.nvim",
    config = function()
      require("telescope").setup({})
      -- To get fzf loaded and working with telescope, you need to call
      -- load_extension, somewhere after setup function:
      require("telescope").load_extension("fzf")
    end,
  },
}
