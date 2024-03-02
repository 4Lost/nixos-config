return {
  {
    "ggandor/leap.nvim",
    config = function()
      local leap = require("leap")

      leap.opts.special_keys.prev_target = "<bs>"
      leap.opts.special_keys.prev_group = "<bs>"
    end,
  },
}
