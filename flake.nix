{
  description = "My NixOS Flake";

  inputs = {
    catppuccin.url = "github:catppuccin/nix";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # impermanence.url = "github:nix-community/impermanence";

    neovim-nightly-overlay.url = "github:nix-community/neovim-nightly-overlay";

    nix-vscode-extensions = {
      url = "github:nix-community/nix-vscode-extensions";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

    nixvim = {
      url = "github:nix-community/nixvim";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nur = {
      url = "github:nix-community/NUR";
    };
  };

  outputs =
    {
      catppuccin,
      home-manager,
      # impermanence,
      nix-vscode-extensions,
      nixpkgs,
      nixvim,
      nur,
      ...
    }@inputs:
    {
      formatter.x86_64-linux = nixpkgs.legacyPackages.x86_64-linux.nixfmt;
      nixosConfigurations = {
        eliasLaptop = nixpkgs.lib.nixosSystem {
          system = "x86_64-linux";
          specialArgs = { inherit inputs; };
          modules = [
            ./machines/configuration-laptop.nix
            ./home/services/pipewire.nix
            nur.modules.nixos.default
            catppuccin.nixosModules.catppuccin
            home-manager.nixosModules.home-manager
            # impermanence.nixosModules.impermanence
            {
              home-manager = {
                useUserPackages = true;
                extraSpecialArgs = { inherit inputs; };
                users.elias.imports = [
                  ./home/default-laptop.nix
                  catppuccin.homeModules.catppuccin
                ];
              };
              nixpkgs.overlays = [
                # (import ./overlays/river-status.nix)
                inputs.nur.overlays.default
                inputs.nix-vscode-extensions.overlays.default
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
            catppuccin.nixosModules.catppuccin
            home-manager.nixosModules.home-manager
            # impermanence.nixosModules.impermanence
            {
              home-manager = {
                useUserPackages = true;
                extraSpecialArgs = { inherit inputs; };
                users.elias.imports = [
                  ./home/default-desktop.nix
                  catppuccin.homeModules.catppuccin
                ];
              };
              nixpkgs.overlays = [
                inputs.nur.overlays.default
                inputs.nix-vscode-extensions.overlays.default
              ];
            }
          ];
        };
        nixos = nixpkgs.lib.nixosSystem {
          system = "x86_64-linux";
          modules = [
            ./machines/configuration-desktop.nix
            ./home/services/pipewire.nix
            nur.modules.nixos.default
            catppuccin.nixosModules.catppuccin
            home-manager.nixosModules.home-manager
            # impermanence.nixosModules.impermanence
            {
              home-manager = {
                useUserPackages = true;
                extraSpecialArgs = { inherit inputs; };
                users.elias.imports = [
                  ./home/default-desktop.nix
                  catppuccin.homeModules.catppuccin
                ];
              };
              nixpkgs.overlays = [
                inputs.nur.overlays.default
                inputs.nix-vscode-extensions.overlays.default
              ];
            }
          ];
        };
      };
    };
}
