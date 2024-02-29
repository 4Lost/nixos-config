{ pkgs, ... }:

{
  programs.feh = {
    enable = true;
  };

  xsession.initExtra = ''
    ${pkgs.feh}/bin/feh --bg-fill --no-fehbg "background_temp.jpeg"
    '';
}
