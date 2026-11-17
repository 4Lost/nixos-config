{ inputs, ... }:

{
  flake.nixosConfigurations.eliasLaptop = inputs.nixpkgs.lib.nixosSystem {
    system = "x86_64-linux";
    specialArgs = { inherit inputs; };
    modules = [
      ../../machines/laptop
      inputs.catppuccin.nixosModules.catppuccin
      inputs.disko.nixosModules.default
      inputs.impermanence.nixosModules.impermanence
      inputs.home-manager.nixosModules.home-manager
      inputs.mangowm.nixosModules.mango
      inputs.nur.modules.nixos.default
      inputs.sops-nix.nixosModules.sops

      {
        home-manager = {
          useUserPackages = true;

          extraSpecialArgs = { inherit inputs; };

          users.elias.imports = [
            ../../home/default-laptop.nix
            inputs.catppuccin.homeModules.catppuccin
            inputs.sops-nix.homeManagerModules.sops
          ];
        };

        nixpkgs.overlays = [
          inputs.nur.overlays.default
          inputs.nix-vscode-extensions.overlays.default
        ];
      }
    ];
  };
}
