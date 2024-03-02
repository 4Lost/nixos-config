return {
  {
        "Bekaboo/dropbar.nvim",
    -- optional, but required for fuzzy finder support
    dependencies = {
      "nvim-telescope/telescope-fzf-native.nvim",
    },
    config = function()
      vim.keymap.set("n", "<leader>bs", function()
        require("dropbar.api").pick(vim.v.count ~= 0 and vim.v.count)
      end)
    end,
  },
}
