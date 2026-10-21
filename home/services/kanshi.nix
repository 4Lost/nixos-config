{ pkgs, ... }:
{
  home.packages = with pkgs; [ kanshi ];

  services.kanshi = {
    enable = true;
    systemdTarget = "graphical-session.target";
    settings = [
      {
        profile.name = "laptop-undocked";
        profile.outputs = [
          {
            criteria = "eDP-1";
            scale = 1.0;
          }
        ];
        profile.exec = [
          "systemctl --user start hypridle.service"
          "eww reload"
        ];
      }
      {
        profile.name = "laptop-docked";
        profile.exec = [
          "systemctl --user stop hypridle.service"
          "eww reload"
        ];
        profile.outputs = [
          {
            criteria = "HDMI-A-1";
            mode = "1920x1080@60Hz";
            position = "0,0";
            scale = 1.0;
          }
          {
            criteria = "eDP-1";
            mode = "1920x1080@60Hz";
            position = "1920,0";
            scale = 1.0;
          }
        ];
      }
      {
        profile.name = "desktop";
        profile.exec = [
          "systemctl --user stop hypridle.service"
          "eww reload"
        ];
        profile.outputs = [
          {
            criteria = "HDMI-A-2";
            mode = "3840x2160@30Hz";
            position = "0,0";
            scale = 1.3;
          }
          {
            criteria = "HDMI-A-1";
            mode = "3840x2160@30Hz";
            position = "3840,0";
            scale = 1.3;
          }
          {
            criteria = "DP-2";
            mode = "3840x2160@60Hz";
            position = "7680,0";
            scale = 1.3;
          }
        ];
      }
      {
        profile.name = "desktop-reduced";
        profile.exec = [
          "systemctl --user stop hypridle.service"
          "eww reload"
        ];
        profile.outputs = [
          {
            criteria = "DVI-D-1";
            mode = "1920x1080@60Hz";
            position = "0,0";
            scale = 1.0;
          }
          {
            criteria = "DP-2";
            mode = "1920x1080@60Hz";
            position = "1920,0";
            scale = 1.0;
          }
        ];
      }
    ];
  };
}
