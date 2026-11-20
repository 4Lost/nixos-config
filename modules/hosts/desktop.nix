{ inputs, self, ... }:

{
  flake.nixosConfigurations.eliasDesktop = inputs.nixpkgs.lib.nixosSystem {
    system = "x86_64-linux";

    modules = with self.modules.nixos; [
      home-manager-desktop
      disko-desktop
      setup-desktop
      system
    ];
  };

  flake.modules.nixos.setup-desktop =
    { config, lib, ... }:

    let
      modulesPath = "${inputs.nixpkgs}/nixos/modules";
    in
    {
      imports = [
        (modulesPath + "/installer/scan/not-detected.nix")
      ];

      networking.hostName = "eliasDesktop";

      boot = {
        initrd = {
          availableKernelModules = [
            "nvme"
            "xhci_pci"
            "ahci"
            "usb_storage"
            "usbhid"
            "sd_mod"
            "sr_mod"
          ];
          kernelModules = [ ];
        };

        kernelModules = [ "kvm-amd" ];
        extraModulePackages = [ ];
      };

      hardware.cpu.amd.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;

      fileSystems = {
        "/".neededForBoot = true;
        "/persist".neededForBoot = true;
        "/nix".neededForBoot = true;
        "/home".neededForBoot = true;
      };
    };
}
