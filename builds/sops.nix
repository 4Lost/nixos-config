{ ... }:

{
  sops = {
    defaultSopsFile = ../secrets/secrets.yaml;
    defaultSopsFormat = "yaml";
    age.keyFile = "/etc/sops/keys.txt";
    secrets."user_password".neededForUsers = true;
    # secrets."git/email" = { };
  };
}
