{ config, lib, pkgs, ... }:

{
  # Import general Configs
  imports = [ ./../hardware-configuration-desktop.nix ./../configuration.nix ];

  # Hostname
  networking.hostName = "eliasDesktop";

  systemd.user.services.autorandr = {
    description = "autorandr profile loader";
    serviceConfig = {
      Type = "oneshot";
      RemainAfterExit = "yes";
    };
    script = ''
      ${pkgs.autorandr}/bin/autorandr --change --default desktop-dual
    '';
    wantedBy = [ "graphical-session.target" ];
  };
}
