{ pkgs, ... }: # scaleFactor,

{
  home.packages = with pkgs; [
    eww
    jq
  ];

  xdg.configFile."eww" = {
    recursive = true;
    source = ./src;
  };

  # xdg.configFile."eww/scipts" = {
  #   recursive = true;
  #   source = ./src/scripts;
  # };
  #
  # xdg.configFile."eww/eww.scss".source = pkgs.replaceVars ./src/eww.scss { inherit scaleFactor; };
  # xdg.configFile."eww/eww.yuck".source = ./src/eww.yuck;
  # xdg.configFile."eww/bar.yuck".source = pkgs.replaceVars ./src/bar.yuck { inherit scaleFactor; };
  # xdg.configFile."eww/power.yuck".source = pkgs.replaceVars ./src/power.yuck { inherit scaleFactor; };
}
