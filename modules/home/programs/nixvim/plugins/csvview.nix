{ ... }:

{
  programs.nixvim = {
    plugins = {
      csvview = {
        enable = true;
        lazyLoad.settings.cmd = [
          "CsvViewEnable"
          "CsvViewToggle"
        ];

        settings = {
          parser.async_chunksize = 30;
          view = {
            display_mode = "border";
            spacing = 2;
          };
        };
      };

      which-key.settings.spec = [
        {
          __unkeyed-1 = "<leader>z";
          group = "CSV";
          icon = " ";
        }
      ];
    };

    keymaps = [
      {
        key = "<leader>ze";
        action = "<Cmd>CsvViewEnable<CR>";
        options.desc = "Csv enable preview";
      }
      {
        key = "<leader>zd";
        action = "<Cmd>CsvViewDisable<CR>";
        options.desc = "Csv disable preview";
      }
      {
        key = "<leader>zt";
        action = "<Cmd>CsvViewToggle<CR>";
        options.desc = "Csv toggle preview";
      }
    ];
  };
}
