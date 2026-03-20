{ ... }:

{
  lock = builtins.path {
    path = ./lockpaper.png;
    name = "lockpaper";
  };
  face = builtins.path {
    path = ./face.icon;
    name = "face";
  };
  background = builtins.path {
    path = ./wallpaper.jpeg;
    name = "wallpaper";
  };
}
