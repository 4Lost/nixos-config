{ pkgs, ... }:

let
  images = pkgs.callPackage ./images.nix { };
in
{
  services.wpaperd = {
    enable = true;

    settings.any.path = "${images.background}";
  };
}
