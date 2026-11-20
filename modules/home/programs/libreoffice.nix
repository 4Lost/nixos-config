{ ... }:

{
  flake.modules.homeManager.libreoffice =
    { pkgs, ... }:

    {
      home.packages = with pkgs; [
        libreoffice-qt
        hunspell
        hunspellDicts.de_DE
        hunspellDicts.en_US
      ];
    };
}
