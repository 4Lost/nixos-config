{ ... }:

{
  sops = {
    defaultSopsFile = ../secrets/secrets.yaml;
    defaultSopsFormat = "yaml";
    age.keyFile = "/etc/sops/key.txt";
    secrets."user_password".neededForUsers = true;
  };
}
