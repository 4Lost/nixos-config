{ config, pkgs, ... }: {
  home.packages = with pkgs; [ stc-cli ];

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
}
