```nix
# {
#   perSystem = { pkgs, ... }: {
#     packages.name = pkgs.sl;
#   };
# }
```

```nix
{ inputs, self, ... }:
{
  flake.nixosConfiguration.eliasLaptop = inputs.nixpkgs.lib.nixosSystem {
    modules = [
      self.nixosModules.myModules
    ];
  };
}
```

```nix
# { inputs, ... }:
# {
#   flake.nixosModules.myModule = { pkgs, ... }: {
#
#     programs.firefox.enable = true;
#
#     environment.systemPackages = with pkgs; [
#       nvim
#     ];
#   };
# }
```

# desktop.nix

rest

```nix
# imports = [
  #   ./../../configuration.nix
  # ];
```

# flake

```nix
            # ./machines/laptop
            self.catppuccin.nixosModules.catppuccin
            self.home-manager.nixosModules.home-manager
            self.mangowm.nixosModules.mango
            self.nur.modules.nixos.default
            self.

            {
              home-manager = {
                useUserPackages = true;

                extraSpecialArgs = { inherit inputs; };

                users.elias.imports = [
                  ./home/default-laptop.nix
                  catppuccin.homeModules.catppuccin
                  sops-nix.homeManagerModules.sops
                ];
              };

              nixpkgs.overlays = [
                inputs.nur.overlays.default
                inputs.nix-vscode-extensions.overlays.default
              ];
            }



          bitwarden-desktop
```

---

# home

home-manager.enable = true;

```nix
{ inputs, self, ... }:
{
  flake.nixosConfiguration.eliasLaptop = inputs.nixpkgs.lib.nixosSystem {
    modules = [
      self.nixosModules.myModules
    ];
  };
}
```
