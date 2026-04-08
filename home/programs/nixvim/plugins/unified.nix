{ ... }:

{
  programs.nixvim = {
    plugins = {
      unified = {
        enable = true;
        lazyLoad.settings.cmd = "Unified";
      };

      which-key.settings.spec = [
        {
          __unkeyed-1 = "<leader>u";
          group = "Unified";
          icon = " ";
        }
      ];
    };
    keymaps = [
      {
        key = "<leader>us";
        action = "<cmd>Unified<cr>";
        options.desc = "Start Unified";
      }
      {
        key = "<leader>uq";
        action = "<cmd>Unified reset<cr><cmd>Unified reset<cr>";
        options.desc = "Stop Unified";
      }
    ];
  };
}
