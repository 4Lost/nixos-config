{ ... }:

{
  programs.nixvim = {
    plugins = {
      toggleterm = {
        enable = true;
        lazyLoad.settings.cmd = [
          "ToggleTermSendCurrentLine"
          "ToggleTermSendVisualLines"
          "ToggleTermSendVisualSelection"
        ];

        settings = {
          open_mapping.__raw = "[[<c-,>]]";
          insert_mappings = true;
          shade_terminals = false;
        };
      };

      which-key.settings.spec = [
        {
          __unkeyed-1 = "<leader>c";
          group = "Terminal";
          icon = " ";
        }
      ];
    };

    keymaps = [
      {
        action = "<CMD>ToggleTermSendCurrentLine<CR>";
        key = "<leader>cl";
        mode = "n";
        options = {
          desc = "Send Current Line";
        };
      }
      {
        action = "<CMD>ToggleTermSendVisualLines<CR>";
        key = "<leader>cv";
        mode = "x";
        options = {
          desc = "Send all the (whole) lines in selection";
        };
      }
      {
        action = "<CMD>ToggleTermSendVisualSelection<CR>";
        key = "<leader>cs";
        mode = "x";
        options = {
          desc = "Send selection";
        };
      }
    ];
  };
}
