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
    crypthome UUID=REPLACE_WITH_SDA_LUKS_UUID /persist/crypt-home.key luks,discard
  '';

  environment.etc."cryptsetup-keys.d/crypthome.key" = {
    source = "/persist/crypt-home.key";
    mode = "0400";
  };
}
