{ ... }:

{
  flake.nixosModules.system =
    { self, ... }:

    {
      modules = [
        self.nixosModules.audio
        self.nixosModules.configuration
        self.nixosModules.home-manager
        self.nixosModules.impermanence
        self.nixosModules.mounts
        self.nixosModules.printer
        self.nixosModules.sops
      ];
    };
}
