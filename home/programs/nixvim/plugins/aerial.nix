{ ... }:

{
  programs.nixvim = {
    plugins = {
      aerial = {
        enable = true;
        lazyLoad.settings.cmd = [
          "AerialToggle"
          "AerialNavToggle"
        ];
      };

      which-key.settings.spec = [
        {
          __unkeyed-1 = "<leader>a";
          group = "Aerial";
          icon = " ";
        }
      ];
    };
    keymaps = [
      {
        key = "<leader>at";
        action = "<cmd>AerialToggle<cr>";
        options.desc = "Aerial tab";
      }
      {
        key = "<leader>an";
        action = "<cmd>AerialNavToggle<cr>";
        options.desc = "Aerial navgation";
      }
      {
        key = "<leader>a.";
        action = "<cmd>AerialNext<cr>";
        options.desc = "Aerial next";
      }
      {
        key = "<leader>a,";
        action = "<cmd>AerialPrev<cr>";
        options.desc = "Aerial previous";
      }
    ];
  };
}
