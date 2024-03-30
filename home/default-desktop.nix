{ config, pkgs, ... }:

{
  imports = [ ./programs/default-desktop.nix ./services ./default.nix ];
}
