{ self, ... }:

{
  flake.modules.homeManager.services =
    { ... }:

    {
      imports = with self.modules.homeManager; [
        fnott
        gpg-agent
        hypridle
        kanshi
        kdeconnect
        nextcloud
        ssh-agent
      ];
    };

  # flake.modules.homeManager.services-desktop =
  #   { ... }:
  #
  #   {
  #     imports = with self.modules.homeManager; [
  #       syncthing-desktop
  #     ];
  #   };
  #
  # flake.modules.homeManager.services-laptop =
  #   { ... }:
  #
  #   {
  #     imports = with self.modules.homeManager; [
  #       syncthing-laptop
  #     ];
  #   };
}
