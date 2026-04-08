{ ... }:

{
  programs.nixvim.plugins = {
    nvim-surround = {
      enable = true;
      luaConfig.post = # lua
        ''
          local M = {}

          M.get_input = function(prompt)
              local input = require("nvim-surround.input")
              return input.get_input(prompt)
          end

          M.get_selection = function(args)
              if args.char then
                  return M.get_find(args.char)(args.char)
              elseif args.motion then
                  return require("nvim-surround.motions").get_selection(args.motion)
              elseif args.node then
                  return require("nvim-surround.treesitter").get_selection(args.node)
              elseif args.pattern then
                  return require("nvim-surround.patterns").get_selection(args.pattern)
              elseif args.query then
                  return require("nvim-surround.queries").get_selection(args.query.capture, args.query.type)
              else
                  vim.notify("Invalid key provided for `:h nvim-surround.config.get_selection()`.", vim.log.levels.ERROR)
              end
          end

          surrounds = {
            ["("] = {
                add = { "( ", " )" },
                find = function()
                    return M.get_selection({ motion = "a(" })
                end,
                delete = "^(. ?)().-( ?.)()$",
            },
            [")"] = {
                add = { "(", ")" },
                find = function()
                    return M.get_selection({ motion = "a)" })
                end,
                delete = "^(.)().-(.)()$",
            },
            ["{"] = {
                add = { "{ ", " }" },
                find = function()
                    return M.get_selection({ motion = "a{" })
                end,
                delete = "^(. ?)().-( ?.)()$",
            },
            ["}"] = {
                add = { "{", "}" },
                find = function()
                    return M.get_selection({ motion = "a}" })
                end,
                delete = "^(.)().-(.)()$",
            },
            ["<"] = {
                add = { "< ", " >" },
                find = function()
                    return M.get_selection({ motion = "a<" })
                end,
                delete = "^(. ?)().-( ?.)()$",
            },
            [">"] = {
                add = { "<", ">" },
                find = function()
                    return M.get_selection({ motion = "a>" })
                end,
                delete = "^(.)().-(.)()$",
            },
            ["["] = {
                add = { "[ ", " ]" },
                find = function()
                    return M.get_selection({ motion = "a[" })
                end,
                delete = "^(. ?)().-( ?.)()$",
            },
            ["]"] = {
                add = { "[", "]" },
                find = function()
                    return M.get_selection({ motion = "a]" })
                end,
                delete = "^(.)().-(.)()$",
            },
            ["'"] = {
                add = { "'", "'" },
                find = function()
                    return M.get_selection({ motion = "a'" })
                end,
                delete = "^(.)().-(.)()$",
            },
            ['"'] = {
                add = { '"', '"' },
                find = function()
                    return M.get_selection({ motion = 'a"' })
                end,
                delete = "^(.)().-(.)()$",
            },
            ["`"] = {
                add = { "`", "`" },
                find = function()
                    return M.get_selection({ motion = "a`" })
                end,
                delete = "^(.)().-(.)()$",
            },
            ["i"] = {
                add = function()
                    local left_delimiter = M.get_input("Enter the left delimiter: ")
                    local right_delimiter = left_delimiter and M.get_input("Enter the right delimiter: ")
                    if right_delimiter then
                        return { { left_delimiter }, { right_delimiter } }
                    end
                end,
                find = function() end,
                delete = function() end,
            },
          }
        '';
      settings = {
        aliases = {
          "a" = ">";
          "b" = ")";
          "B" = "}";
          "r" = "]";
          "q" = [
            "\""
            "'"
            "`"
          ];
          "Q" = "''";
          "s" = [
            "}"
            "]"
            ")"
            ">"
            "\""
            "'"
            "`"
          ];
        };
        keymaps = {
          insert = "<C-g>s";
          insert_line = "<C-g>S";
          normal = "ys";
          normal_cur = "yss";
          normal_line = "yS";
          normal_cur_line = "ySS";
          visual = "S";
          visual_line = "gS";
          delete = "ds";
          # TODO: This keymap clashed with comment boxses
          change = "cs";
          change_line = "cS";
        };
      };
    };
  };
}
