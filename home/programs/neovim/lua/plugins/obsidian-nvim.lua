return {
  {
    "epwalsh/obsidian.nvim",
    lazy = true,
    event = {
      "BufReadPre " .. vim.fn.expand("~") .. "**.md",
      "BufNewFile " .. vim.fn.expand("~") .. "**.md",
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
            name = "COe",
            path = "/run/user/1000/gvfs/smb-share:server=192.168.0.100,share=administration/NetzwerkTeam/wiki",
          },
          {
            name = "work",
            path = "~/Notes/work",
          },
          {
            name = "studies",
            path = "~/Notes/studies",
          },
        },
      })
    end,
  },
}
