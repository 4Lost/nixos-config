{ ... }:

{
  programs.nixvim = {
    plugins = {
      yazi = {
        enable = true;
        lazyLoad.settings.event = [
          "BufReadPost"
          "BufNewFile"
        ];
      };

      which-key.settings.spec = [
        {
          __unkeyed-1 = "<leader>y";
          group = "Yazi";
          icon = " ";
        }
      ];
    };
    keymaps = [
      {
        key = "<leader>yf";
        action = "<cmd>Yazi<cr>";
        options.desc = "Open yazi at the current file";
      }
      {
        key = "<leader>yw";
        action = "<cmd>Yazi cwd<cr>";
        options.desc = "Open yazi at the current working directory";
      }
      {
        key = "<leader>yl";
        action = "<cmd>Yazi toggle<cr>";
        options.desc = "Resume the last session";
      }
    ];
  };
}
