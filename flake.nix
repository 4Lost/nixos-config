{
  description = "My NixOS Flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nur = {
      url = "github:nix-community/NUR";
    };

    nixvim = {
      url = "github:nix-community/nixvim";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # Nix expressions for VSCode and OpenVSX extensions
    nix-vscode-extensions = {
      url = "github:nix-community/nix-vscode-extensions";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    neovim-nightly-overlay.url = "github:nix-community/neovim-nightly-overlay";
  };

  outputs =
    {
      nixpkgs,
      home-manager,
      nur,
      nixvim,
      ...
    }@inputs:
    {
      formatter.x86_64-linux = nixpkgs.legacyPackages.x86_64-linux.nixfmt-rfc-style;
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
                useUserPackages = true;
                extraSpecialArgs = { inherit inputs; };
                users.elias = import ./home/default-laptop.nix;
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
            home-manager.nixosModules.home-manager
            {
              home-manager = {
                useUserPackages = true;
                extraSpecialArgs = { inherit inputs; };
                users.elias = import ./home/default-desktop.nix;
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
