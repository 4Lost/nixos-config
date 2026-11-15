{ utils, ... }:

{
  boot.initrd.systemd.services.wipe-root = {
    unitConfig.DefaultDependencies = false;
    serviceConfig.Type = "oneshot";
    wantedBy = [ "initrd.target" ];
    before = [ "sysroot.mount" ];

    requires = [ "${utils.escapeSystemdPath "/dev/root_vg/root"}.device" ];
    after = [
      "${utils.escapeSystemdPath "/dev/root_vg/root"}.device"
      "local-fs-pre.target"
    ];

    script = ''
      mkdir /btrfs_tmp
      mount /dev/root_vg/root /btrfs_tmp
      trap 'umount /btrfs_tmp' EXIT
      if [[ -e /btrfs_tmp/root ]]; then
          mkdir -p /btrfs_tmp/old_roots
          timestamp=$(date --date="@$(stat -c %Y /btrfs_tmp/root)" "+%Y-%m-%-d_%H:%M:%S")
          mv /btrfs_tmp/root "/btrfs_tmp/old_roots/$timestamp"
      fi

      for i in $(find /btrfs_tmp/old_roots/ -maxdepth 1 -mtime +30); do
          btrfs subvolume delete --recursive "$i"
      done

      btrfs subvolume create /btrfs_tmp/root
    '';
  };

  environment.persistence."/persist" = {
    hideMounts = true;

    directories = [
      "/etc/NetworkManager/system-connections"
      "/etc/sops"
      "/etc/ssh"
      "/var/lib/bluetooth"
      "/var/lib/nixos"
      "/var/lib/systemd"
      "/var/log"
    ];

    files = [
      "/etc/machine-id"
    ];
  };
}
