{ pkgs, ... }:

{
  home.packages = with pkgs; [
    ripgrep
    fd
  ];
  programs.nixvim.plugins = {
    telescope = {
      enable = true;
      extensions = {
        fzf-native.enable = true;
        ui-select.enable = true;
        undo.enable = true;
        file-browser = {
          enable = true;
          settings = {
            hijack_netrw = true;
          };
        };
      };
      keymaps = {
        "<leader>ff" = {
          action = "find_files";
          options.desc = "List Files";
        };
        "<leader>fb" = {
          action = "file_browser path=%:p:h select_buffer=true";
          options.desc = "File Browser";
        };
        "<leader>fs" = {
          action = "buffers";
          options.desc = "List Open Buffers";
        };
        "<leader>fu" = {
          action = "undo";
          options.desc = "Undo Tree";
        };
      };
    };
    which-key.settings.spec = [
      {
        __unkeyed-1 = "<leader>f";
        group = "Telescope";
        icon = "󰭎 ";
      }
    ];
  };
}
