{ inputs, self, ... }:

{
  flake.modules.nixos.home-manager =
    { ... }:

    {
      imports = [
        inputs.home-manager.nixosModules.home-manager
      ];

      home-manager.users.elias = {
        imports = [
          self.modules.homeManager.elias
          inputs.nixvim.homeModules.nixvim
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
      home-manager.users.elias.imports = with self.modules.homeManager; [
        programs-desktop
        services-desktop
      ];
    };

  flake.modules.nixos.home-manager-laptop =
    { ... }:

    {
      home-manager.users.elias.imports = with self.modules.homeManager; [
        programs-laptop
        services-laptop
      ];
    };

  flake.modules.homeManager.elias =
    { pkgs, ... }:

    {
      imports = with self.modules.homeManager; [
        extras
        programs
        services
        themes
        old
      ];

      home = {
        packages = with pkgs; [
          unzip
          zip
          tree
          which

          # system tools
          lm_sensors
          pavucontrol

          cups
          firefox
          bitwarden-desktop

          # Sops
          age
          sops
        ];

        stateVersion = "26.05";
      };

      nixpkgs.config = {
        allowUnfree = true;
        permittedInsecurePackages = [ "electron-39.8.10" ];
      };
    };

  flake.modules.homeManager.old =
    { ... }:

    {
      imports = [
        ../../home/programs/default.nix
      ];
    };
}
