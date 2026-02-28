{ ... }:

{
  programs.hyprlock = {
    enable = true;
    settings = {
      general = {
        # disable_loading_bar = true;
        # grace = 300;
        hide_cursor = true;
        ignore_empty_input = true;
        # no_fade_in = false;
      };

      animations = {
        enabled = true;
        fade_in = {
          duration = 300;
          bezier = "easeOutQuint";
        };
        fade_out = {
          duration = 300;
          bezier = "easeOutQuint";
        };
      };

      background = [
        {
          path = "screenshot";
          blur_passes = 2;
          blur_size = 3;
        }
      ];

      auth = {
        fingerprint = {
          enabled = true;
          # Optional: Customize messages
          ready_message = "(Scan fingerprint to unlock)";
          present_message = "Scanning fingerprint";
          retry_delay = 250;
        };
      };

      input-field = [
        {
          size = "200, 50";
          position = "0, -80";
          monitor = "";
          dots_center = true;
          fade_on_empty = false;
          font_color = "rgb(202, 211, 245)";
          inner_color = "rgb(91, 96, 120)";
          outer_color = "rgb(24, 25, 38)";
          outline_thickness = 3;
          placeholder_text = ''<span foreground="##cad3f5">Password...</span>'';
          shadow_passes = 2;
        }
      ];
    };
  };
}
