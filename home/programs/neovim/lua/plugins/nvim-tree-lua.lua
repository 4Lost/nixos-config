return {
  {
    "nvim-tree/nvim-tree.lua",
    lazy = false,
    keys = {
      { "<leader>ft", "<CMD>NvimTreeToggle<CR>", desc = "Nvim Tree" },
    },
    dependencies = {
      "nvim-tree/nvim-web-devicons",
    },
    config = function()
      require("nvim-tree").setup({
        hijack_netrw = false,
        hijack_unnamed_buffer_when_opening = false,
        hijack_directories = {
          enable = false,
        },
      })
    end,
  },
}

