{
  description = "My NixOS Flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-23.11";
    home-manager = {
      url = "github:nix-community/home-manager/release-23.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    xmonad-contrib.url = "github:xmonad/xmonad-contrib";
  };

  inputs.neovim-nightly-overlay.url =
    "github:nix-community/neovim-nightly-overlay";
  outputs = { self, nixpkgs, xmonad-contrib, home-manager, ... }@inputs: {
    nixosConfigurations = {
      eliasLaptop = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules = [
          ./configuration.nix
          home-manager.nixosModules.home-manager
          {
            home-manager = {
              useGlobalPkgs = true;
              useUserPackages = true;
              users.elias = import ./home/default.nix;
            };
            nixpkgs.overlays = [
              (final: prev: {
                xmobar = final.haskellPackages.callPackage
                  ./home/programs/xmonad/src/xmobar/default.nix { };
              })
              inputs.neovim-nightly-overlay.overlay
            ];
          }
        ] ++ xmonad-contrib.nixosModules ++ [
          # `modernise` replaces the standard xmonad module and wrapper script
          # with those from unstable. This is currently a necessary workaround to
          # make Mod-q recompilation work.
          xmonad-contrib.modernise."x86_64-linux"
        ];
      };
    };
  };
}
