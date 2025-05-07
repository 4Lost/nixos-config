{ pkgs, ... }:

{
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

