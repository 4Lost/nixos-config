{ ... }:

{
  programs.nixvim = {
    plugins = {
      barbar = {
        enable = true;
      };
      which-key.settings.spec = [
        {
          __unkeyed-1 = "<leader>b";
          group = "Buffers";
          icon = "󰓩 ";
        }
        {
          __unkeyed-1 = "<leader>,";
          icon = " ";
        }
        {
          __unkeyed-1 = "<leader>.";
          icon = " ";
        }
      ];
    };
    keymaps = [
      {
        action = "<CMD>BufferPrevious<CR>";
        key = "<leader>,";
        mode = "n";
        options = {
          desc = "Tab ";
        };
      }
      {
        action = "<CMD>BufferNext<CR>";
        key = "<leader>.";
        mode = "n";
        options = {
          desc = "Tab ";
        };
      }
      {
        action = "<CMD>BufferMovePrevious<CR>";
        key = "<leader>b<";
        mode = "n";
        options = {
          desc = "Re-Order ";
        };
      }
      {
        action = "<CMD>BufferMoveNext<CR>";
        key = "<leader>b>";
        mode = "n";
        options = {
          desc = "Re-Order ";
        };
      }
      {
        action = "<CMD>BufferClose<CR>";
        key = "<leader>bc";
        mode = "n";
        options = {
          desc = "Close";
        };
      }
      {
        action = "<CMD>tabnew +Telescope\\ file_browser<CR>";
        key = "<leader>bn";
        mode = "n";
        options = {
          desc = "Create";
        };
      }
      {
        action = "<CMD>BufferPick<CR>";
        key = "<leader>bp";
        mode = "n";
        options = {
          desc = "Pick Tab";
        };
      }
    ];
  };
}

