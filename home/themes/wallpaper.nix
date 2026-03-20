{ pkgs, ... }:

let
  images = pkgs.callPackage ./images { };
in
{
  services.wpaperd = {
    enable = true;

    settings.any.path = "${images.background}"; # TODO: change wallpaper / make automatic pull from some website? -> animals and fallback to something if no iternet
  };
}
