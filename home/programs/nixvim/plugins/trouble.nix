{ ... }:

{
  programs.nixvim = {
    plugins = {
      trouble = {
        enable = true;
        settings = {
          modes = {
            diagnostics = {
              auto_close = true;
              auto_open = false;
            };
            # Diagnostics for the current buffer only
            diagnostics_buffer = {
              mode = "diagnostics";
              filter = {
                buf = 0;
              };
            };
          };
          focus = false;
          open_no_results = true;
          # Plugin Default
          keys = {
            "<2-leftmouse>" = "jump";
            "<c-s>" = "jump_split";
            "<c-v>" = "jump_vsplit";
            "<cr>" = "jump";
            "<esc>" = "cancel";
            "?" = "help";
            P = "toggle_preview";
            R = "toggle_refresh";
            "[[" = "prev";
            "]]" = "next";
            d = {
              action = "delete";
              mode = "v";
            };
            dd = "delete";
            gb = {
              action = {
                __raw = ''
                  function(view)
                    view:filter({ buf = 0 }, { toggle = true })
                  end
                '';
              };
              desc = "Toggle Current Buffer Filter";
            };
            i = "inspect";
            o = "jump_close";
            p = "preview";
            q = "close";
            r = "refresh";
            s = {
              action = {
                __raw = ''
                  function(view)
                     local f = view:get_filter("severity")
                     local severity = ((f and f.filter.severity or 0) + 1) % 5
                     view:filter({ severity = severity }, {
                       id = "severity",
                       template = "{hl:Title}Filter:{hl} {severity}",
                       del = severity == 0,
                     })
                  end
                '';
              };
              desc = "Toggle Severity Filter";
            };
            zA = "fold_toggle_recursive";
            zC = "fold_close_recursive";
            zM = "fold_close_all";
            zN = "fold_enable";
            zO = "fold_open_recursive";
            zR = "fold_open_all";
            zX = "fold_update_all";
            za = "fold_toggle";
            zc = "fold_close";
            zi = "fold_toggle_enable";
            zm = "fold_more";
            zn = "fold_disable";
            zo = "fold_open";
            zr = "fold_reduce";
            zx = "fold_update";
            "{" = "prev";
            "}" = "next";
          };
          # Plugin Default
          icons = {
            folder_closed = " ";
            folder_open = " ";
            indent = {
              fold_closed = " ";
              fold_open = " ";
              last = "└╴";
              middle = "├╴";
              top = "│ ";
              ws = "  ";
            };
            kinds = {
              Array = " ";
              Boolean = "󰨙 ";
              Class = " ";
              Constant = "󰏿 ";
              Constructor = " ";
              Enum = " ";
              EnumMember = " ";
              Event = " ";
              Field = " ";
              File = " ";
              Function = "󰊕 ";
              Interface = " ";
              Key = " ";
              Method = "󰊕 ";
              Module = " ";
              Namespace = "󰦮 ";
              Null = " ";
              Number = "󰎠 ";
              Object = " ";
              Operator = " ";
              Package = " ";
              Property = " ";
              String = " ";
              Struct = "󰆼 ";
              TypeParameter = " ";
              Variable = "󰀫 ";
            };
          };

        };
      };
      which-key.settings.spec = [
        {
          __unkeyed-1 = "<leader>x";
          group = "Trouble";
          icon = " ";
        }
      ];
    };
    keymaps = [
      {
        key = "<leader>xx";
        action = "<CMD>Trouble diagnostics toggle<CR>";
        options.desc = "Diagnostics";
      }
      {
        key = "<leader>xt";
        action = "<CMD>Trouble todo toggle<CR>";
        options.desc = "Todos";
      }
      {
        key = "<leader>xX";
        action = "<CMD>Trouble diagnostics toggle filter.buf=0<CR>";
        options.desc = "Buffer Diagnostics";
      }
      {
        key = "<leader>xL";
        action = "<CMD>Trouble loclist toggle<CR>";
        options.desc = "Location List";
      }
      {
        key = "<leader>xQ";
        action = "<CMD>Trouble qflist toggle<CR>";
        options.desc = "Quickfix List";
      }
    ];
  };
}
