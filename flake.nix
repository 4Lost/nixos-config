{
  inputs = {
    catppuccin.url = "github:catppuccin/nix";

    disko.url = "github:nix-community/disko";

    flake-parts.url = "github:hercules-ci/flake-parts";

    images.url = "github:4Lost/nixos-images";

    impermanence.url = "github:nix-community/impermanence";

    import-tree.url = "github:vic/import-tree";

    home-manager.url = "github:nix-community/home-manager";

    mangowm.url = "github:mangowm/mango";

    neovim-nightly-overlay.url = "github:nix-community/neovim-nightly-overlay";

    nix-vscode-extensions.url = "github:nix-community/nix-vscode-extensions";

    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

    nixvim.url = "github:nix-community/nixvim";

    nur.url = "github:nix-community/NUR";

    sops-nix.url = "github:Mic92/sops-nix";

    yazi.url = "github:sxyazi/yazi";

    yazi-bunny = {
      url = "github:stelcodes/bunny.yazi";
      flake = false;
    };

    yazi-exifaudio = {
      url = "github:Sonico98/exifaudio.yazi";
      flake = false;
    };

    zen-browser.url = "github:youwen5/zen-browser-flake";
  };

  outputs =
    inputs@{ flake-parts, ... }:
    flake-parts.lib.mkFlake { inherit inputs; } {
      imports = [
        inputs.flake-parts.flakeModules.modules
        (inputs.import-tree.matchNot ".*/home/programs/nixvim(/.*)?" ./modules)
      ];
    };
}
