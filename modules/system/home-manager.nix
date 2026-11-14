{
  inputs,
  pkgs,
  self,
  ...
}:

{
  flake.modules.nixos.home-manager = {
    imports = [
      inputs.home-manager.nixosModules.default
      inputs.nixvim.homeModules.nixvim
    ];

    home-manager.users.elias = {
      imports = [
        self.modules.homeManager.elias
      ];
      home = {
        username = "elias";
        homeDirectory = "/home/elias";
        sessionVariables.EDITOR = "nvim";
      };
    };
  };

  flake.modules.nixos.home-manager-desktop =
    { ... }:

    {
      imports = [
        self.modules.nixos.home-manager
      ];

      home-manager.users.elias.imports = with self.modules.homeManager; [
        programs-desktop
      ];
    };

  flake.modules.nixos.home-manager-laptop =
    { ... }:

    {
      imports = [
        self.modules.nixos.home-manager
      ];

      home-manager.users.elias.imports = with self.modules.homeManager; [
        programs-laptop
      ];
    };

  flake.modules.homeManager.elias =
    { ... }:

    {
      imports = with self.modules.homeManager; [
        extras
        programs
        services
        themes

        # ../home/programs/nixvim
      ];

      home = {
        packages = with pkgs; [
          unzip
          zip
          tree
          which
        ];

        stateVersion = "26.05";
      };

      nixpkgs.config = {
        allowUnfree = true;
        permittedInsecurePackages = [ "electron-39.8.10" ];
      };
    };
}
