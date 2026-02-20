{ ... }:

{
  programs.nixvim = {
    plugins = {
      toggleterm = {
        enable = true;
        settings = {
          open_mapping.__raw = "[[<c-,>]]";
          insert_mappings = true;
          shade_terminals = false;
        };
      };
    };

    keymaps = [
      {
        action = "<CMD>ToggleTermSendCurrentLine<CR>";
        key = "<leader>sts";
        mode = "n";
        options = {
          desc = "Send Current Line";
        };
      }
      {
        action = "<CMD>ToggleTermSendVisualLines<CR>";
        key = "<leader>stv";
        mode = "x";
        options = {
          desc = "Send all the (whole) lines in selection";
        };
      }
      {
        action = "<CMD>ToggleTermSendVisualSelection<CR>";
        key = "<leader>sts";
        mode = "x";
        options = {
          desc = "Send selection";
        };
      }
    ];
  };
}
