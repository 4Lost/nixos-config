{ ... }:

{
  environment.persistence."/persist" = {
    hideMounts = true;

    directories = [
      "/etc/NetworkManager/system-connections"
      "/etc/ssh"
      "/var/lib/bluetooth"
      "/var/lib/nixos"
      "/var/lib/systemd"
      "/var/lib/flatpak"
      "/var/lib/sops-nix"
    ];

    files = [
      "/etc/machine-id"
    ];
  };
}
