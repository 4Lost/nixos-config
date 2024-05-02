{ ... }:

{
  services.betterlockscreen = {
    enable = true;
    arguments = [ "blur" ];
    inactiveInterval = 30;
  };
}
