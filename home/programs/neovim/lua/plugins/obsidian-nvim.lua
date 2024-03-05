return {
  {
    "epwalsh/obsidian.nvim",
    lazy = true,
    event = {
      "BufReadPre /home/elias/Dropbox/IJB/IJB-Notes/*",
      "BufNewFile /home/elias/Dropbox/IJB/IJB-Notes/*",
    },
    dependencies = {
      "nvim-lua/plenary.nvim",
      "hrsh7th/nvim-cmp",
      "nvim-telescope/telescope.nvim",
      "nvim-treesitter",
    },
    config = function()
      vim.opt.conceallevel = 2
      require("obsidian").setup({
        workspaces = {
          {
            name = "IJB-Notes",
            path = "/home/elias/Dropbox/IJB/IJB-Notes",
          },
        },
      })
    end,
  },
}
