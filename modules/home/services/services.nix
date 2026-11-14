{ self, ... }:

{
  flake.modules.homeManager.services =
    { ... }:

    {
      imports = with self.modules.homeManager; [
        fnott
        gpg-agent
        hyperidle
        kanshi
        kdeconnect
        nextcloud
        ssh-agent
        syncthing
      ];
    };
}
