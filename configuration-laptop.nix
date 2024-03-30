{ config, lib, pkgs, ... }:

{
  # Import general Configs
  imports = [ ./configuration.nix ];

  # Hostname
  networking.hostName = "eliasLaptop";
}
