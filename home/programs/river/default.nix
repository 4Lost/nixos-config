{ pkgs, lib, ... }:

{
  home.packages = with pkgs; [
    wlr-randr
    yad slurp
    grim
    wl-clipboard
    rivercarro
    # river-status
  ];
  xdg.configFile."helperscripts" = {
    recursive = true;
    source = ./src;
  };

  wayland.windowManager.river = let
    all_tags = "$(((1 << 32) - 1))";
    scratch_tag = "$((1 << 20 ))";
    all_but_scratch_tag = "$(( ((1 << 32) - 1) ^ ${scratch_tag} ))";
    tags = i: "$((1 << (${i} - 1)))";

    genTagMappings = key: command:
      lib.attrsets.mergeAttrsList
      (map (i: { "${key (toString i)}" = "${command (toString i)}"; })
        (lib.lists.range 1 9));
  in {
    enable = true;
    extraSessionVariables = {
      MOZ_ENABLE_WAYLAND = "1";
      GDK_BACKEND = "wayland";
    };
    systemd = { enable = true; };
    xwayland.enable = true;
    extraConfig = ''
      rivertile -view-padding 0 -outer-padding 0 &
    '';
    settings = {
      spawn = [
        "nextcloud --background"
        "/home/elias/.config/helperscripts/startEww.sh"
      ];
      spawn-tagmask = "${all_but_scratch_tag}";
      keyboard-layout = "de";
      #keyboard-layout = "-options caps:swapescape 'us(colemak_dh)'";
      default-layout = "rivertile";
      rule-add = {
        "-app-id" = {
          "'bar'" = "csd";
          "'float*'" = { "-title" = { "'foo'" = "float"; }; };
        };
      };
      map-pointer = {
        normal = {
          "Super BTN_LEFT" = "move-view";
          "Super BTN_RIGHT" = "resize-view";
          "Super BTN_MIDDLE" = "toggle-float";
        };
      };
      map = {
        normal = {
          "Super+Shift Return" = "spawn alacritty";
          # Messages
          "Control+Super W" = "spawn 'yad --text=\"Hello from Wayland!\" --button=OK'";
          # System
          "Super P" = "spawn 'rofi -show drun'";
          "Super+Shift C" = "close";
          # Screenshots
          "None Print" = "spawn 'grim ~/Pictures/screenshot_$(date +%F_%H-%M-%S).png; yad --text=\"Screenshot - Whole Screen to File (/home/$USER/Pictures/screenshot-$(date -u +%Y-%m-%d-%H:%M:%S))\"'"; # Whole Screen to File
          "Super Print" = "spawn 'grim -g \"$(slurp)\" ~/Pictures/screenshot_$(date +%F_%H-%M-%S).png; yad --text=\"Screenshot - Selection to File (/home/$USER/Pictures/screenshot-$(date -u +%Y-%m-%d-%H:%M:%S))\"'"; # Selection to File
          "Shift Print" = "spawn 'grim -g \"$(riverctl windows --focused | awk '{print $3,$4,$5,$6}')\" ~/Pictures/active_window_$(date +%F_%H-%M-%S).png; yad --text=\"Screenshot - Active Window to File (/home/$USER/Pictures/screenshot-$(date -u +%Y-%m-%d-%H:%M:%S))\"'"; # Active Window to File
          "Control Print" = "spawn 'grim -g \"$(slurp)\" - | wl-copy --type image/png; yad --text=\"Screenshot - Whole Screen to Clipboard\"'"; # Whole Screen to Clipboard
          "Control+Super Print" = "spawn 'grim -g \"$(slurp)\" - | wl-copy --type image/png; yad --text=\"Screenshot - Selection to Clipboard\"'"; # Selection to Clipboard
          "Control+Shift Print" = "spawn 'grim -g \"$(riverctl windows --focused | awk '{print $3,$4,$5,$6}')\" - | wl-copy --type image/png; yad --text=\"Screenshot - Active Window to Clipboard\"'"; # Active Window to Clipboard
          # Window Control
          "Super J" = "focus-view next";
          "Super K" = "focus-view previous";
          "Super+Shift J" = "swap next";
          "Super+Shift K" = "swap previous";
          "Super Period" = "focus-output next";
          "Super Comma" = "focus-output previous";
          "Super+Shift Period" = "send-to-output next";
          "Super+Shift Comma" = "send-to-output previous";
          "Super H" = ''send-layout-cmd rivertile "main-ratio -0.05"'';
          "Super L" = ''send-layout-cmd rivertile "main-ratio +0.05"'';
          "Super+Shift H" = ''send-layout-cmd rivertile "main-count +1"'';
          "Super+Shift L" = ''send-layout-cmd rivertile "main-count -1"'';
          "Super+Alt H" = "move left 100";
          "Super+Alt J" = "move down 100";
          "Super+Alt K" = "move up 100";
          "Super+Alt L" = "move right 100";
          "Super+Alt+Control H" = "snap left";
          "Super+Alt+Control J" = "snap down";
          "Super+Alt+Control K" = "snap up";
          "Super+Alt+Control L" = "snap right";
          "Super+Alt+Shift H" = "resize horizontal -100";
          "Super+Alt+Shift J" = "resize vertical 100";
          "Super+Alt+Shift K" = "resize vertical -100";
          "Super+Alt+Shift L" = "resize horizontal 100";

          "Super+Shift P" = "set-view-tags ${scratch_tag}";

          "Super 0" = "set-focused-tags ${all_tags}";
          "Super+Shift 0" = "set-view-tags ${all_tags}";
          "Super Space" = "toggle-float";
          "Super F" = "toggle-fullscreen";
          "Super Up" = ''send-layout-cmd rivertile "main-location top"'';
          "Super Right" = ''send-layout-cmd rivertile "main-location right"'';
          "Super Down" = ''send-layout-cmd rivertile "main-location bottom"'';
          "Super Left" = ''send-layout-cmd rivertile "main-location left"'';
          # Audio
          "None XF86AudioRaiseVolume" = "spawn 'pactl set-sink-volume @DEFAULT_SINK@ +10%'";
          "None XF86AudioLowerVolume" = "spawn 'pactl set-sink-volume @DEFAULT_SINK@ -10%'";
          "None XF86AudioMute" = "spawn 'pactl set-sink-mute @DEFAULT_SINK@ toggle'";
          "None XF86AudioMicMute" = "spawn 'pactl set-source-mute @DEFAULT_SOURCE@ toggle'";
          # Brightness
          "None XF86MonBrightnessUp" = "spawn 'xbacklight -inc 10'";
          "None XF86MonBrightnessDown" = "spawn 'xbacklight -dec 10'";
          # Powerbutton
          "None XF86PowerOff" = "spawn '/home/$USER/.config/eww/scripts/powermenu.sh'";
          # Program
          "Super C" = "spawn 'firefox'";
          "Super Y" = "spawn 'signal-desktop'";
          "Super X" = "spawn 'telegram-desktop'";
          "Super V" = "spawn 'thunderbird'";
        } // genTagMappings (i: "Super ${i}") (i: "set-focused-tags ${tags i}")
          // genTagMappings (i: "Super+Shift ${i}")
          (i: "set-view-tags ${tags i}")
          // genTagMappings (i: "Super+Control ${i}")
          (i: "toggle-focused-tags ${tags i}")
          // genTagMappings (i: "Super+Shift+Control ${i}")
          (i: "toggle-view-tags ${tags i}");
      };
    };
  };
}
