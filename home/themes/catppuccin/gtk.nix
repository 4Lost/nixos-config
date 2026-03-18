{ pkgs, ... }:

{
  home.packages = with pkgs; [ dconf ];

  gtk = {
    enable = true;
    theme = {
      name = "Catppuccin-Mocha-Compact-Pink-Dark";
      package = pkgs.catppuccin-gtk.override {
        accents = [ "pink" ];
        size = "compact";
        tweaks = [ "rimless" ];
        variant = "mocha";
      };
    };
    font = {
      package = pkgs.fira-code;
      name = "Fira Code";
    };
    iconTheme = {
      package = pkgs.oranchelo-icon-theme;
      name = "Oranchelo";
    };
  };

}
