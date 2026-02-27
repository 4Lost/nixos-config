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
in
{
  home.packages = with pkgs; [
    pinentry-rofi
    pinentry-gnome3
  ];

  programs.gpg = {
    enable = true;
    scdaemonSettings = {
      disable-ccid = true;
    };
    settings = {
      personal-cipher-preferences = "AES256 AES192 AES";
      personal-digest-preferences = "SHA512 SHA384 SHA256";
      personal-compress-preferences = "ZLIB BZIP2 ZIP Uncompressed";
      default-preference-list = "SHA512 SHA384 SHA256 AES256 AES192 AES ZLIB BZIP2 ZIP Uncompressed";
      cert-digest-algo = "SHA512";
      s2k-digest-algo = "SHA512";
      s2k-cipher-algo = "AES256";
      charset = "utf-8";
      no-comments = true;
      no-emit-version = true;
      no-greeting = true;
      keyid-format = "0xlong";
      list-options = "show-uid-validity";
      verify-options = "show-uid-validity";
      with-fingerprint = true;
      require-cross-certification = true;
      no-symkey-cache = true;
      armor = true;
      use-agent = true;
      throw-keyids = true;
      keyserver = "hkps://keyserver.ubuntu.com:443";
    };
  };

  services.gpg-agent = {
    enable = true;
    enableZshIntegration = true;
    enableNushellIntegration = true;
    defaultCacheTtl = 60;
    maxCacheTtl = 120;
    enableSshSupport = true;
    sshKeys = [ "8E42E6C65D5F9894CFFF294851AB0CEB5F0B1FAA" ];
    pinentry.package = pkgs.pinentry-gnome3;
    # under extraConfig
    # pinentry-program ${pinentryRofi}/bin/pinentry-rofi-with-env
    extraConfig = ''
      ttyname $GPG_TTY
    '';
  };
}
