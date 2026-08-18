{ pkgs, ... }:

{
  home.pointerCursor = {
    enable = true;
    package = pkgs.catppuccin-cursors.mochaPink;
    name = "Catppuccin-Mocha-Pink-Cursors";
    gtk.enable = true;
  };
}
