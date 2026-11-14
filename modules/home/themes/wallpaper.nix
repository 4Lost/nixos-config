{ inputs, ... }:

{
  flake.modules.homeManager.wallpaper =
    { ... }:

    {
      services.wpaperd = {
        enable = true;
        settings.any.path = "${inputs.images.background}";
      };
    };
}
