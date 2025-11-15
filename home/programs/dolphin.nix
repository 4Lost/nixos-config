{ pkgs, ... }:

{
  home.packages = with pkgs; [
    kdePackages.dolphin
    kdePackages.dolphin-plugins
    kdePackages.baloo-widgets
    kdePackages.baloo
    nautilus
    udisks
  ];
  xdg.configFile."menus/applications.menu".source = "${pkgs.kdePackages.plasma-workspace}/etc/xdg/menus/plasma-applications.menu";
}
