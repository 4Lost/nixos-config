vim.g.mapleader = " "
require("lazy").setup({
  spec = {
    -- Import plugins from lua/plugins
    { import = "plugins" },
  },
  performance = {
    reset_packpath = false,
    rtp = {
      reset = false,
    },
  },
  dev = {
    path = "@path@/pack/myNeovimPackages/start",
    patterns = {
      "folke",
      "catppuccin",
      "geodimm",
      "Julian",
      "hrsh7th",
      "neovim",
      "rafamadriz",
      "saadparwaiz1",
      "L3MON4D3",
      "onsails",
      "nvim-lua",
      "Olical",
      "PaterJason",
      "iamcco",
      "nvim-treesitter",
      "HiPhish",
      "lervag",
      "windwp",
      "kylechui",
      "numToStr",
      "JoosepAlviste",
      "stevearc",
      "nvim-tree",
      "tpope",
      "karb94",
      "akinsho",
      "nvim-lualine",
      "arkav",
      "nvimdev",
      "ggandor",
      "Bekaboo",
      "nvim-telescope",
      "aserowy",
      "3rd",
      "epwalsh",
      "preservim",
      "elkowar",
      "dynamotn",
      "LhKipp",
      "Fanael",
    },
  },
  install = {
    -- Safeguard in case we forget to install a plugin with Nix
    missing = false,
  },
})
require("config/options")
