{ pkgs, ... }:

{
  home.packages = with pkgs; [ grim ];
  services.flameshot = {
    enable = true;
    settings = {
      General = {
        disabledTrayIcon = true;
        showDesktopNotification = false;
        showHelp = false;
        showStartupLaunchMessage = false;
        useGrimAdapter = true;
      };
    };
  };
}
