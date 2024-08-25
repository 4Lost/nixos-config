{ config, pkgs, ... }:

{
  imports = [ ./programs/default-desktop.nix ./default.nix ];
}
