{ inputs, self, ... }:

{
  flake.nixosConfiguration.eliasLaptop = inputs.nixpkgs.lib.nixosSystem {
    modules = [
      self.nixosModules.disko-laptop
      self.nixosModules.setup-laptop
      self.nixosModules.system
    ];
  };

  flake.nixosModules.setup-laptop =
    {
      config,
      lib,
      modulesPath,
      pkgs,
      ...
    }:

    {
      imports = [
        (modulesPath + "/installer/scan/not-detected.nix")
      ];

      networking.hostName = "eliasLaptop";

      # # ── Fingerprint ───────────────────────────────────────────────────────
      # services.fprintd = {
      #   enable = true;
      #   tod = {
      #     enable = true;
      #     driver = pkgs.libfprint-2-tod1-goodix;
      #   };
      # };

      boot = {
        initrd = {
          availableKernelModules = [
            "nvme"
            "ehci_pci"
            "xhci_pci"
            "usb_storage"
            "sd_mod"
            "rtsx_pci_sdmmc"
          ];
          kernelModules = [ ];
        };
        kernelModules = [ "kvm-amd" ];
        extraModulePackages = [ ];
      };

      networking.useDHCP = lib.mkDefault true;

      nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
      hardware.cpu.amd.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;

      fileSystems = {
        "/".neededForBoot = true;
        "/persist".neededForBoot = true;
        "/nix".neededForBoot = true;
        "/home".neededForBoot = true;
      };
    };
}
