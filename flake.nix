{
  description = "My chaos NixOS flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-23.11";
    home-manager = {
      url = "github:nix-community/home-manager/release-23.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # The xmonad-contrib flake depends upon and re-exports from the xmonad
    # flake. As such, you don't need to use the latter directly. If you wish to
    # use /only/ the xmonad flake, you should beware that the version of
    # contrib you get from nixpkgs might not build against it.
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
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.users.elias = import ./home/default.nix;
            nixpkgs.overlays = [ inputs.neovim-nightly-overlay.overlays ];
          }
        ];
      };
    };
  };
}
