return {
  {
    "stevearc/oil.nvim",
    opts = {},
    lazy = false,
    config = function()
      require("oil").setup({
        default_file_explorer = true,
        delete_to_trash = true,
        experimental_watch_for_changes = true,
        use_default_keymaps = true,
      })
    end,
    keys = {
      { "-", "<CMD>Oil<CR>", desc = "Open parent directory" },
    },
    -- Optional dependencies
    dependencies = { "nvim-tree/nvim-web-devicons" },
  },
}
