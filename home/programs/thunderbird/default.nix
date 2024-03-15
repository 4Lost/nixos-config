{ pkgs, ... }:

{
  programs.thunderbird = {
    enable = true;
    profiles = {
      privat.isDefault = true;
      kjr.isDefault = false;
    };
    settings = { };
  };
  accounts.email = {
    accounts = {
      kjr = {
        address = "elias.schroeter@kjr-ebe.de";
        imap = {
          host = "outlook.office365.com";
          port = 993;
          tls.enable = true;
        };
        realName = "Elias Schröter";
        signature = {
          text = ''
            Mit freundlichen Grüßen,
            Elias Schröter.
          '';
          showSignature = "append";
        };
        passwordCommand = "mail-password";
        smtp = {
          host = "smtp.office365.com";
          port = 587;
          tls = {
            enable = true;
            useStartTls = true;
          };
        };
        userName = "elias.schroeter@kjr-ebe.de";
        thunderbird = { enable = true; };
      };
      privat = {
        address = "elias.schroeter@e.email";
        gpg = {
          key = "0x99D2EF975FE523CC";
          signByDefault = true;
        };
        aliases = [ "eliasschrei@gmail.com" "elias.schroeter1601@gmail.com" ];
        imap = {
          host = "mail.ecloud.global";
          port = 993;
          tls.enable = true;
        };
        realName = "Elias Schröter";
        signature = {
          text = ''
            Mit freundlichen Grüßen,
            Elias Schröter.
          '';
          showSignature = "append";
        };
        passwordCommand = "mail-password";
        smtp = {
          host = "mail.ecloud.global";
          port = 587;
          tls = {
            enable = true;
            useStartTls = true;
          };
        };
        userName = "elias.schroeter@e.email";
        primary = true;
        thunderbird = { enable = true; };
      };
    };
  };
}
