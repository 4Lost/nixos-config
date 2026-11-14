{
  config,
  inputs,
  lib,
  self,
  ...
}:

let
  modulesPath = "${inputs.nixpkgs}/nixos/modules";
in

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

  flake.modules.nios.setup-laptop =
    { ... }:

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

      hardware.cpu.amd.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;

      fileSystems = {
        "/".neededForBoot = true;
        "/persist".neededForBoot = true;
        "/nix".neededForBoot = true;
        "/home".neededForBoot = true;
      };
    };
}
