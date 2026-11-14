{ config, pkgs, ... }: {
  home.packages = with pkgs; [ stc-cli ];

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
}
