{ config, pkgs, ... }:

{
  imports = [ ./programs/default-laptop.nix ./services ./default.nix ];

  home.file,"git/minlog".source = config.lib.file.mkOutOfStorageSymlink "${pkgs.minlog}/share/minlog";
}
