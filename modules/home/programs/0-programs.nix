{ self, ... }:

{
  flake.modules.homeManager.programs =
    { ... }:

    {
      imports = with self.modules.homeManager; [
        anki
        audacity
        calibre
        digikam
        direnv
        eww
        filebrowser
        git
        hyprlock
        imv
        inkscape
        kitty
        libreoffice
        mango
        messenger
        nixvim
        picard
        printer
        pulseaudio
        rofi
        skanlite
        spotify
        taskwarrior
        thunderbird
        vlc
        vscode
        zathura
        zen
        zoom
        zsh
      ];
    };

  flake.modules.homeManager.programs-desktop =
    { ... }:

    {
      imports = with self.modules.homeManager; [
        games
        mango-desktop
      ];
    };

  flake.modules.homeManager.programs-laptop =
    { ... }:

    {
      imports = with self.modules.homeManager; [
        mango-laptop
      ];
    };

}
