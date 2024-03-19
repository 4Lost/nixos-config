{ pkgs, ... }:

{
  home.programs = with pkgs.libsForQt5; [ ktouch ];
}
