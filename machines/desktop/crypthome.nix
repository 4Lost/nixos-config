{ ... }:

{
  boot.initrd.systemd.enable = true;

  fileSystems."/home" = {
    device = "/dev/mapper/crypthome";
    fsType = "btrfs";
    options = [
      "subvol=home"
      "compress=zstd"
      "noatime"
    ];
  };

  environment.etc."crypttab".text = ''
    crypthome UUID=9cc606f2-ba19-4d8e-bae6-755b9d3b886f /persist/crypt-home.key luks,discard
  '';

  environment.etc."cryptsetup-keys.d/crypthome.key" = {
    source = "/persist/crypt-home.key";
    mode = "0400";
  };
}
