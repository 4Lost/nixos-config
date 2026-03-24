{ ... }:

{
  sops = {
    defaultSopsFile = "./secrets/secrets.yaml";
    defaultSopsFormat = "yaml";
    age.keyFile = "/etc/sops/keys.txt";
  };
}
