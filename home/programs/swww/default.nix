{ pkgs, ... }:

{
  home.packages = with pkgs; [
    swww
  ];
  xsession.initExtra = ''
    swww-daemon
    swww img "/etc/nixos/home/programs/wallpaper/background_temp.jpeg" fill
  '';
}
