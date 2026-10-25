{ ... }:

{
  fileSystems."/home/elias/Downloads" = {
    device = "tmpfs";
    fsType = "tmpfs";
    options = [
      "defaults"
      "mode=700"
      "uid=elias"
      "gid=users"
      "size=32G"
    ];
  };

  fileSystems."/home/elias/.cache" = {
    device = "tmpfs";
    fsType = "tmpfs";
    options = [
      "defaults"
      "mode=700"
      "uid=elias"
      "gid=users"
      "size=16G"
    ];
  };

  fileSystems."/home/elias/.local/share/Trash" = {
    device = "tmpfs";
    fsType = "tmpfs";
    options = [
      "defaults"
      "mode=700"
      "uid=elias"
      "gid=users"
      "size=8G"
    ];
  };
}
