{ self, ... }:

{
  flake.modules.homeManager.themes =
    { ... }:

    {
      imports = with self.modules.homeManager; [
        catppuccin
        wallpaper
      ];
    };
}
