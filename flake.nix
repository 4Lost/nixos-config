{
  description = "My NixOS Flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nur = { url = "github:nix-community/NUR"; };

    neovim-nightly-overlay = {
      url = "github:nix-community/neovim-nightly-overlay";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { nixpkgs, home-manager, nur, ... }@inputs: {
    formatter.x86_64-linux =
      nixpkgs.legacyPackages.x86_64-linux.nixfmt-rfc-style;
    nixosConfigurations = {
      eliasLaptop = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules = [
          ./machines/configuration-laptop.nix
          ./home/services/pipewire.nix
          nur.modules.nixos.default
          home-manager.nixosModules.home-manager
          {
            home-manager = {
              useGlobalPkgs = true;
              useUserPackages = true;
              extraSpecialArgs = { inherit inputs; };
              users.elias = import ./home/default-laptop.nix;
            };
            nixpkgs.overlays = [
              # (import ./overlays/river-status.nix)
              inputs.nur.overlays.default
            ];
          }
        ];
      };
      eliasDesktop = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules = [
          ./machines/configuration-desktop.nix
          ./home/services/pipewire.nix
          nur.modules.nixos.default
          home-manager.nixosModules.home-manager
          {
            home-manager = {
              useGlobalPkgs = true;
              useUserPackages = true;
              extraSpecialArgs = { inherit inputs; };
              users.elias = import ./home/default-desktop.nix;
            };
            nixpkgs.overlays = [
              inputs.nur.overlays.default
            ];
          }
        ];
      };
    };
  };
}
