return {
  {
    "Olical/conjure",
    ft = { "lua", "python", "scheme" },
    dependencies = {
      {
        "PaterJason/cmp-conjure",
        config = function()
          local cmp = require("cmp")
          local config = cmp.get_config()
          table.insert(config.sources, {
            name = "buffer",
            option = {
              sources = {
                { name = "conjure" },
              },
            },
          })
          cmp.setup(config)
        end,
      },
    },
    config = function()
      require("conjure.main").main()
      require("conjure.mapping")["on-filetype"]()
      vim.g["conjure#debug"] = false
      vim.g["conjure#client#scheme#stdio#command"] = "scheme"
      vim.g["conjure#client#scheme#stdio#prompt_pattern"] = "> $?"
      vim.g["conjure#mapping#prefix"] = "<leader>,"
      vim.g["conjure#extract#tree_sitter#enabled"] = true
    end,
  },
}

