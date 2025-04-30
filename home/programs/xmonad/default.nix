{ pkgs, ... }:

{
  xsession = {
    enable = true;
    windowManager = {
      xmonad = {
        enable = true;
        enableContribAndExtras = true;
        config = ./src/xmonad.hs;
      };
    };
  };

  home.packages = with pkgs; [
    xmobar
    maim
    xdotool
    xorg.xmessage
    ghc
    cabal-install
    wmctrl
    trayer
  ];
}
