{ ... }:

{
  programs.nixvim = {
    plugins = {
      leap = {
        enable = true;
        settings = {
          case_sensitive = false;
        };
      };
    };
    keymaps = [
      {
        key = "s";
        action = "<Plug>(leap)";
        mode = [
          "n"
          "x"
          "o"
        ];
      }
      {
        key = "S";
        action = "<Plug>(leap-from-window)";
        mode = [ "n" ];
      }
    ];
  };
}
