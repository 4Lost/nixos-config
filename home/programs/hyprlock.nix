{ ... }:

{
  programs.hyprlock = {
    enable = true;
    settings = {
      # ── colors ────────────────────────────────────────────────────────────
      mocha-base = "rgb(1e1e2e)";
      mocha-mantle = "rgb(181825)";
      mocha-crust = "rgb(11111b)";
      mocha-text = "rgb(cdd6f4)";
      mocha-subtext1 = "rgb(bac2de)";
      mocha-subtext0 = "rgb(a6adc8)";
      mocha-surface2 = "rgb(585b70)";
      mocha-overlay0 = "rgb(6c7086)";
      mocha-blue = "rgb(89b4fa)";
      mocha-peach = "rgb(fab387)";
      mocha-lavender = "rgb(cba6f7)";
      mocha-white = "rgb(cdd6f5)";

      general = {
        hide_cursor = true;
        ignore_empty_input = true;
        text_trim = false;
        fail_timeout = 500;
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
          noise = 0.0117;
          contrast = 1.3000;
          brightness = 0.8000;
          vibrancy = 0.2100;
          vibrancy_darkness = 0.0;
        }
      ];

      label = [
        # ── Hours ─────────────────────────────────────────────────────────────
        {
          size = "200, 50";
          position = "50, 100";
          monitor = "";
          text = "cmd[update:1000] printf '<b><big>%(%H)T</big></b>'";
          color = "$mocha-lavender";
          font_size = 80;
          font_family = "Fira Code";
          shadow_passes = 3;
          shadow_size = 4;
          halign = "left";
          valign = "bottom";
        }

        # ── : ─────────────────────────────────────────────────────────────────
        {
          position = "170, 105";
          monitor = "";
          text = ":";
          color = "$mocha-subtext1";
          font_size = 80;
          font_family = "Fira Code";
          shadow_passes = 3;
          shadow_size = 4;
          halign = "left";
          valign = "bottom";
        }

        # ── Minutes ───────────────────────────────────────────────────────────
        {
          position = "220, 100";
          monitor = "";
          text = "cmd[update:1000] printf '<b><big>%(%M)T</big></b>'";
          color = "$mocha-blue";
          font_size = 80;
          font_family = "Fira Code";
          shadow_passes = 3;
          shadow_size = 4;
          halign = "left";
          valign = "bottom";
        }

        # ── "Monday 2, May" ───────────────────────────────────────────────────
        {
          position = "370, 130";
          monitor = "";
          text = "cmd[update:300000] printf '<b>%(%A, %d %b)T</b>'";
          color = "$mocha-text";
          font_size = 18;
          font_family = "Fira Code";
          shadow_passes = 3;
          shadow_size = 4;
          halign = "left";
          valign = "bottom";
        }

        # ── Battery ───────────────────────────────────────────────────────────
        {
          position = "-30, -10";
          monitor = "";
          text = "cmd[update:2000] printf '  %s%%' \"$(cat /sys/class/power_supply/BAT0/capacity)\"";
          color = "$mocha-peach";
          font_size = 15;
          font_family = "Fira Code";
          shadow_passes = 3;
          shadow_size = 4;
          halign = "right";
          valign = "top";
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
