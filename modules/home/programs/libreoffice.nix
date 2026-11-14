{ pkgs, ... }:

{
  flake.modules.homeManager.libreoffice =
    { ... }:

    {
      home.packages = with pkgs; [
        libreoffice-qt
        hunspel
        hunspellDicts.de_DE
        hunspellDicts.en_EN
      ];
    };
}
