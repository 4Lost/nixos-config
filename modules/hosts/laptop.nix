{ inputs, self, ... }:

{
  flake.nixosConfigurations.eliasLaptop = inputs.nixpkgs.lib.nixosSystem {
    system = "x86_64-linux";

    modules = with self.modules.nixos; [
      home-manager-laptop
      disko-laptop
      setup-laptop
      system
    ];
  };

  flake.modules.nixos.setup-laptop =
    { config, lib, ... }:

    let
      modulesPath = "${inputs.nixpkgs}/nixos/modules";
    in
    {
      imports = [
        (modulesPath + "/installer/scan/not-detected.nix")
      ];

      networking.hostName = "eliasLaptop";

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

      hardware.cpu.amd.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;

      fileSystems = {
        "/".neededForBoot = true;
        "/persist".neededForBoot = true;
        "/nix".neededForBoot = true;
        "/home".neededForBoot = true;
      };
    };
}
