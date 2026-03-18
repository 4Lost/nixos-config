{ inputs, ... }:

{
  services.wpaperd = {
    enable = true;

    settings.any.path = "${inputs.images}/wallpaper.jpeg"; # TODO: change wallpaper / make automatic pull from some website? -> animals and fallback to something if no iternet
  };
}
