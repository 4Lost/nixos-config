{ pkgs, ... }:

{
  systemd.user.services.nextcloud = {
    description = "Nextcloud Desktop Client";
    after = [ "graphical-session.target" ]; # started nach der grafischen Sitzung
    serviceConfig = {
      ExecStart = "${pkgs.nextcloud}/bin/nextcloud";
      Restart = "on-failure";
      Environment = ''
        MOZ_ENABLE_WAYLAND=1
        GDK_BACKEND=wayland
      '';
    };
    wantedBy = [ "default.target" ];
  };
}
