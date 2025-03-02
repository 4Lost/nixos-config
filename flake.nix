{
  description = "My NixOS Flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    xmonad-contrib = {
      url = "github:xmonad/xmonad-contrib";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nur = { url = "github:nix-community/NUR"; };

    neovim-nightly-overlay = {
      url = "github:nix-community/neovim-nightly-overlay";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    wpaperd = {
      url = "github:danyspin97/wpaperd";
      inputs.nixpkgs.follows = "nixpkgs";
    };

  };

  outputs = { nixpkgs, xmonad-contrib, home-manager, nur, ... }@inputs: {
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
              useUserPackages = true;
              extraSpecialArgs = { inherit inputs; };
              users.elias = import ./home/default-laptop.nix;
            };
            nixpkgs.overlays = [
              (final: prev: {
                xmobar = final.haskellPackages.callPackage
                  ./home/programs/xmonad/src/xmobar/default.nix { };
              })
              inputs.neovim-nightly-overlay.overlays.default
              inputs.wpaperd.overlays.default
              inputs.nur.overlays.default
              (import overlays/minlog.nix)
              (import overlays/obsidian.nix)
            ];
          }
        ] ++ xmonad-contrib.nixosModules;
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
              (final: prev: {
                xmobar = final.haskellPackages.callPackage
                  ./home/programs/xmonad/src/xmobar/default.nix { };
              })
              inputs.neovim-nightly-overlay.overlays.default
              inputs.wpaperd.overlays.default
              inputs.nur.overlays.default
              (import overlays/minlog.nix)
              (import overlays/obsidian.nix)
            ];
          }
        ] ++ xmonad-contrib.nixosModules;
      };
    };
  };
}
