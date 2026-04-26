{ pkgs, ... }:

{
  home.packages = with pkgs; [
    discord
    element-desktop
    signal-desktop
    slack
    telegram-desktop
  ];
}
