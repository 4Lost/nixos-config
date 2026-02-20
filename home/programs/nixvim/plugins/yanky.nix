{ ... }:

{
  programs.nixvim = {
    plugins = {
      yanky = {
        enable = true;
        settings = {
          ring = {
            storage = "sqlite";
          };
        };
      };

      sqlite-lua = {
        enable = true;
      };
    };

    keymaps = [
      {
        key = "p";
        action = "<Plug>(YankyPutAfter)";
        mode = [
          "n"
          "x"
        ];
      }
      {
        key = "P";
        action = "<Plug>(YankyPutBefore)";
        mode = [
          "n"
          "x"
        ];
      }
      {
        key = "gp";
        action = "<Plug>(YankyGPutAfter)";
        mode = [
          "n"
          "x"
        ];
      }
      {
        key = "gP";
        action = "<Plug>(YankyGPutBefore)";
        mode = [
          "n"
          "x"
        ];
      }
      {
        key = "<c-p>";
        action = "<Plug>(YankyPreviousEntry)";
        mode = [
          "n"
        ];
      }
      {
        key = "<c-n>";
        action = "<Plug>(YankyNextEntry)";
        mode = [
          "n"
        ];
      }
    ];
  };
}
