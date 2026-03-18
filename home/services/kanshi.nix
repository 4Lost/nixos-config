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
          "eww reload"
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
            criteria = "eDP-1";
            mode = "1920x1080@60Hz";
            position = "1920,0";
          }
          {
            criteria = "HDMI-A-1";
            mode = "1920x1080@60Hz";
            position = "0,0";
          }
        ];
      }
      # {
      #   profile.name = "desktop";
      #   profile.exec = [
      #     "systemctl --user start hypridle.service"
      #   ];
      #   profile.outputs = [
      #     {
      #       criteria = "eDP-1";
      #       mode = "1920x1080@60Hz";
      #       position = "1920,0";
      #     }
      #     {
      #       criteria = "HDMI-A-1";
      #       mode = "1920x1080@60Hz";
      #       position = "0,0";
      #     }
      #   ];
      # }
    ];
  };
}
