{ ... }:

{
  sops = {
    defaultSopsFile = ../secrets/secrets.yaml;
    defaultSopsFormat = "yaml";
    age.keyFile = "/persist/etc/sops/keys.txt";
    secrets."user_password".neededForUsers = true;
  };
}
