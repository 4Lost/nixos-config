{ pkgs, ... }:

{
  programs.feh = { enable = true; };

  xsession.initExtra = ''
    ${pkgs.feh}/bin/feh --bg-fill --no-fehbg "/etc/nixos/home/programs/wallpaper/background_temp.jpeg"
  '';
}
