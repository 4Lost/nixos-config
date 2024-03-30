{ pkgs, lib, ... }:

{
  home.packages = with pkgs; [ libreoffice-qt hunspell hunspellDicts.de_DE ];
}
