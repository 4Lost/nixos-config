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
      #displayManagaer = {
      #  sddm = {
      #    enable = true;
      #    theme = "sugar-dark";
      #  };
      #  defaultSession = "none+xmonad";
      #};
    };
  };

  home.packages = [ pkgs.xmobar ];
}
