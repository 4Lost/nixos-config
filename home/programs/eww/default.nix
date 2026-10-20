{ pkgs, ... }: # isDesktop

{
  home.packages = with pkgs; [
    eww
    jq
  ];

  xdg.configFile."eww" = {
    recursive = true;
    source = ./src;
  };

  # xdg.configFile."eww/eww.scss" = {
  #   force = true;
  #   text =
  #     if isDesktop then
  #       ''
  #         $scale: 2;
  #         @import "style.scss";
  #       ''
  #     else
  #       ''
  #         $scale: 1;
  #         @import "style.scss";
  #       '';
  # };
}
