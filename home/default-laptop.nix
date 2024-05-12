{ config, pkgs, ... }:

{
  imports = [ ./programs/default-laptop.nix ./services ./default.nix ];

  home.file."minlog".source =
    config.lib.file.mkOutOfStoreSymlink "${pkgs.minlog}/share/minlog";

}
