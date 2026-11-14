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
        eww
        filebrowser
        git
        hyprlock
        imv
        inkscape
        kitty
        libreoffice
        messenger
        mango
        models
        picard
        pulseaudio
        rofi
        skanlite
        spotify
        taskwarrior
        thunderbird
        vlc
        vscodium
        zathura
        zen
        zoom
        zsh
      ];
    };
}
