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
  home.packages = with pkgs; [ pinentry-rofi ];

  programs.gpg.enable = true;

  services.gpg-agent = {
    enable = true;
    enableZshIntegration = true;
    pinentryFlavor = null;
    defaultCacheTtl = 7200; # 2h
    maxCacheTtl = 28800; # 8h
    extraConfig = ''
      pinentry-program ${pinentryRofi}/bin/pinentry-rofi-with-env
    '';
  };
}

