{ self, ... }:

{
  flake.modules.nixos.system =
    { ... }:

    {
      imports = with self.modules.nixos; [
        audio
        boot
        configuration
        home-manager
        impermanence
        mounts
        printer
        sops
      ];
    };
}
