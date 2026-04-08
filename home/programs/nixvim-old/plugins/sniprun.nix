{ ... }:

{
  programs.nixvim = {
    plugins = {
      sniprun = {
        enable = true;
        settings = {
          display = [ "VirtualLine" ];
          snipruncolors = {
            SniprunVirtualTextOk = {
              bg = "#91d7e3";
              fg = "#000000";
              ctermbg = "Cyan";
              ctermfg = "Black";
            };
            SniprunVirtualTextErr = {
              bg = "#ee99a0";
              fg = "#000000";
              ctermbg = "DarkRed";
              ctermfg = "Black";
            };
          };
        };
      };
    };
  };
}
