{ ... }:

{
  fileSystems."/home/elias/Downloads" = {
    device = "tmpfs";
    fsType = "tmpfs";
    options = [
      "defaults"
      "mode=700"
      "uid=1000"
      "gid=100"
      "size=32G"
    ];
  };

  fileSystems."/home/elias/.cache" = {
    device = "tmpfs";
    fsType = "tmpfs";
    options = [
      "defaults"
      "mode=700"
      "uid=1000"
      "gid=100"
      "size=16G"
    ];
  };

}
