{ ... }:

{
  sops = {
    defaultSopsFile = ../../secrets/secrets.yaml;
    defaultSopsFormat = "yaml";
    age.keyFile = "/etc/sops/keys.txt";

    # ── Define Secrets ────────────────────────────────────────────────────
    secrets."ssh/private".path = "/home/elias/.ssh/id_rsa";
    secrets."ssh/public".path = "/home/elias/.ssh/id_rsa.pub";
  };
}
