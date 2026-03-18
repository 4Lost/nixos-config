{ pkgs, ... }:

{
  home.packages = with pkgs; [
    fira-code
  ];

  programs.alacritty = {
    enable = true;

    settings.font = {
      size = 8;
      normal.family = "Fira Code";
      bold.family = "Fira Code";
      italic.family = "Fira Code";
    };
  };
}
