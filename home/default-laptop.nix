{ config, pkgs, ... }:

{
  imports = [ ./programs/default-laptop.nix ./services ./default.nix ];
}
