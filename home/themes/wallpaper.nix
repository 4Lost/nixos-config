{ inputs, pkgs, ... }:

{
  services.wpaperd = {
    enable = true;

    settings.any.path = "${inputs.images.background}";
  };
}
