{ pkgs, ... }:
{
  home.packages = with pkgs; [ kanshi ];

  services.kanshi = {
    enable = true;
    systemdTarget = "graphical-session.target";
    settings = [
      {
        profile.name = "laptop-undocked";
        profile.outputs = [ { criteria = "eDP-1"; } ];
        profile.exec = [
          "systemctl --user start hypridle.service"
        ];
      }
      {
        profile.name = "laptop-docked";
        profile.exec = [
          "systemctl --user start hypridle.service"
          "eww reload"
        ];
        profile.outputs = [
          {
            criteria = "HDMI-A-1";
            mode = "1920x1080@60Hz";
            position = "0,0";
          }
          {
            criteria = "eDP-1";
            mode = "1920x1080@60Hz";
            position = "1920,0";
          }
        ];
      }
      {
        profile.name = "desktop";
        profile.exec = [
          "systemctl --user stop hypridle.service"
        ];
        profile.outputs = [
          {
            criteria = "HDMI-A-2";
            mode = "1920x1080@60Hz";
            position = "0,0";
          }
          {
            criteria = "DVI-D-1";
            mode = "1920x1080@60Hz";
            position = "1920,0";
          }
          {
            criteria = "DP-2";
            mode = "1920x1080@60Hz";
            position = "3840,0";
          }
        ];
      }
      {
        profile.name = "desktop-reduced";
        profile.exec = [
          "systemctl --user stop hypridle.service"
        ];
        profile.outputs = [
          {
            criteria = "DVI-D-1";
            mode = "1920x1080@60Hz";
            position = "0,0";
          }
          {
            criteria = "DP-2";
            mode = "1920x1080@60Hz";
            position = "1920,0";
          }
        ];
      }
    ];
  };
}
