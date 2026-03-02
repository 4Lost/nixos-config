{ pkgs, ... }:

{
  home.packages = with pkgs; [
    swww
  ];
  xsession.initExtra = ''
    swww-daemon
    swww img "/etc/nixos/home/programs/swww/background_temp.jpeg" fill
  '';
}
