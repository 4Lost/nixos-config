{ pkgs, ... }:

# See https://github.com/nix-community/home-manager/issues/3095
let
  pinentryRofi = pkgs.writeShellApplication {
    name = "pinentry-rofi-with-env";
    text = ''
      PATH="$PATH:${pkgs.coreutils}/bin:${pkgs.rofi}/bin"
      "${pkgs.pinentry-rofi}/bin/pinentry-rofi" "$@"
    '';
  };
in {
  home.packages = with pkgs; [ pinentry-rofi pinentry-gnome3 ];

  programs.gpg.enable = true;

  services.gpg-agent = {
    enable = true;
    pinentryPackage = pkgs.pinentry-gnome3;
    enableZshIntegration = true;
    defaultCacheTtl = 7200; # 2h
    maxCacheTtl = 28800; # 8h
    extraConfig = ''
      ttyname $GPG_TTY
    '';

  };
}

