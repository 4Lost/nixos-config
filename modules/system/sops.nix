{ inputs, pkgs, ... }:

{
  flake.modules.nixos.sops =
    { ... }:

    {
      imports = [ inputs.sops-nix.nixosModules.sops ];

      environment.systemPackages = with pkgs; [
        age
        sops
      ];

      sops = {
        defaultSopsFile = ../../secrets/secrets.yaml;
        defaultSopsFormat = "yaml";
        age.keyFile = "/persist/etc/sops/key.txt";
        secrets."user_password".neededForUsers = true;
      };
    };
}
