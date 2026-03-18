{ config, pkgs, ... }:
{
  qt = {
    enable = true;
    platformTheme.name = "qtct";
    style.name = "kvantum";
  };

  home.packages = with pkgs; [
    (catppuccin-kvantum.override {
      variant = "mocha";
      accent = "pink";
    })
    libsForQt5.qtstyleplugin-kvantum
    libsForQt5.qt5ct
  ];
}
