{ ... }:

{
  flake.modules.homeManager.syncthing-laptop =
    { config, pkgs, ... }:

    {
      home.packages = with pkgs; [ stc-cli ];

      sops.secrets = {
        "syncthing/laptop/key" = { };
        "syncthing/laptop/cert" = { };
      };

      services.syncthing = {
        enable = true;

        key = config.sops.secrets."syncthing/laptop/key".path;
        cert = config.sops.secrets."syncthing/laptop/cert".path;

        settings = {
          devices.eliasDesktop.id = "RURLW7P-2GSSYRH-QDIQ7XZ-KSVUWO2-ESH2223-5LDEDHU-PSF6WAD-NPR64Q6";

          folders.cloud = {
            id = "yvrja-dy9bn";
            path = "${config.home.homeDirectory}/Nextcloud";

            devices = [ "eliasDesktop" ];

            type = "sendreceive";
            ignorePerms = false;
          };
        };
      };
    };

  flake.modules.homeManager.syncthing-desktop =
    { config, pkgs, ... }:

    {
      home.packages = with pkgs; [ stc-cli ];

      sops.secrets = {
        "syncthing/desktop/key" = { };
        "syncthing/desktop/cert" = { };
      };

      services.syncthing = {
        enable = true;

        key = config.sops.secrets."syncthing/desktop/key".path;
        cert = config.sops.secrets."syncthing/desktop/cert".path;

        settings = {
          devices.eliasLaptop.id = "BRZIFYS-EZQYYYI-KHTMWIK-NUR67WJ-NRTC2BY-Y44RREH-J74U2JY-5Z3OXAH";

          folders.cloud = {
            id = "yvrja-dy9bn";
            path = "${config.home.homeDirectory}/Nextcloud";

            devices = [ "eliasLaptop" ];

            type = "sendreceive";
            ignorePerms = false;
          };
        };
      };
    };
}
