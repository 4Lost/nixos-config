{
  inputs = import ./inputs.nix;

  outputs =
    inputs@{ flake-parts, ... }:
    flake-parts.lib.mkFlake { inherit inputs; } (inputs.import-tree ./modules);
}
#   };
#
#   outputs =
#     {
#       formatter.x86_64-linux = nixpkgs.legacyPackages.x86_64-linux.nixfmt;
#       nixosConfigurations = {
#         eliasLaptop = nixpkgs.lib.nixosSystem {
#         };
#
#         eliasDesktop = nixpkgs.lib.nixosSystem {
#           system = "x86_64-linux";
#           specialArgs = { inherit inputs; };
#           modules = [
#             ./machines/desktop
#             catppuccin.nixosModules.catppuccin
#             home-manager.nixosModules.home-manager
#             mangowm.nixosModules.mango
#             nur.modules.nixos.default
#
#             {
#               home-manager = {
#                 useUserPackages = true;
#
#                 extraSpecialArgs = { inherit inputs; };
#
#                 users.elias.imports = [
#                   ./home/default-desktop.nix
#                   catppuccin.homeModules.catppuccin
#                   sops-nix.homeManagerModules.sops
#                 ];
#               };
#
#               nixpkgs.overlays = [
#                 inputs.nur.overlays.default
#                 inputs.nix-vscode-extensions.overlays.default
#               ];
#             }
#           ];
#         };
#       };
#     };
# }
