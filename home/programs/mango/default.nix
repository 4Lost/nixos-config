{
  inputs,
  config,
  pkgs,
  ...
}:

{
  imports = [
    inputs.mangowm.hmModules.mango
  ];

  home.packages = with pkgs; [
    # XDG Portals
    xdg-desktop-portal-wlr
    wl-clipboard
    xdg-desktop-portal
    # Screenshots
    grim
    slurp
    satty
    # wayfreeze

    # wlr-randr
  ];
  xdg.configFile."helperscripts" = {
    recursive = true;
    source = ./src;
  };

  wayland.windowManager.mango = {
    enable = true;
    systemd = {
      enable = true;
      # xdgAutostart = '' '';
    };
    settings = {
      # /-- Monitors --/
      # later: see what kanshi can do with it.

      # /-- Input --/
      xkb_rules_layout = "de";
      touch_enable = 0;

      # /-- Theming --/
      gap_inner_horizontal = 5;
      gap_inner_vertical = 5;
      gap_outer_horizontal = 0;
      gap_outer_vertical = 0;

      root_color = "0x323232ff";
      border_color = "0x444444ff";
      drop_color = "0x8FBA7C55";
      split_color = "0xEB441EFF";
      focus_color = "0xf5bde6ff";
      urgent_color = "0xed8796ff";

      tab_bar_height = 33;
      title_message_bar_height = 52;

      # /-- Layout --/
      circle_layout = "tile,fair,center_tile,scroller";

      # Keys
      bind = [
        # Send current window to scratchpad
        "Super,I,minimized"
        # Toggle (show/hide) the scratchpad
        "Alt,Z,toggle_scratchpad"
        # Retrieve window from scratchpad (restore)
        "Super+Shift,N,restore_minimized"
        "Super+Shift,Return,spawn,kitty"
        "Super,P,spawn,rofi -show drun"
        "Super+Shift,C,killclient"
        # Screenshots
        "NONE,Print,spawn,/home/$USER/.config/eww/scripts/screenshot-window-to-file.sh"
        "Super,Print,spawn,/home/$USER/.config/eww/scripts/screenshot-window-to-clipboard.sh"
        "Ctrl,Print,spawn,/home/$USER/.config/eww/scripts/screenshot-screen-to-file.sh"
        "Ctrl+Super,Print,spawn,/home/$USER/.config/eww/scripts/screenshot-screen-to-clipboard.sh"
        "Shift,Print,spawn,/home/$USER/.config/eww/scripts/screenshot-selection-to-file.sh"
        "Super+Shift,Print,spawn,/home/$USER/.config/eww/scripts/screenshot-selection-to-clipboard.sh"
        # Window Ctrl
        "Super,N,switch_layout"
        "Super,R,zoom"
        "Super,J,focusstack,next"
        "Super,K,focusstack,prev"
        "Super+Shift,J,exchange_stack_client,next"
        "Super+Shift,K,exchange_stack_client,prev"
        "Super,Period,focusmon,next"
        "Super,Comma,focusmon,prev"
        "Super+Shift,Period,tagmon,next"
        "Super+Shift,Comma,tagmon,prev"
        "Super,H,setmfact,-0.05"
        "Super,L,setmfact,+0.05"
        "Super+Shift,H,incnmaster,+1"
        "Super+Shift,L,incnmaster,-1"
        "Super+Alt,H,movewin,(-100,0)"
        "Super+Alt,J,movewin,(0,-100)"
        "Super+Alt,K,movewin,(0,100)"
        "Super+Alt,L,movewin,(100,0)"
        "Super+Alt+Ctrl,H,smartmovewin,left"
        "Super+Alt+Ctrl,J,smartmovewin,down"
        "Super+Alt+Ctrl,K,smartmovewin,up"
        "Super+Alt+Ctrl,L,smartmovewin,right"
        "Super+Alt+Shift,H,resizewin,(-100,0)"
        "Super+Alt+Shift,J,resizewin,(0,100)"
        "Super+Alt+Shift,K,resizewin,(0,-100)"
        "Super+Alt+Shift,L,resizewin,(100,0)"

        # "Super+Shift,P,view," = "set-view-tags ${scratch_tag}";

        "Super,0,comboview,1|2|3|4|5|6|7|8|9"
        "Super+Shift,0,toggleglobal"
        "Super,Space,togglefloating"
        "Super,F,togglefullscreen"
        # Audio
        "None,XF86AudioRaiseVolume,spawn,wpctl set-volume @DEFAULT_AUDIO_SINK@ 0.1+"
        "None,XF86AudioLowerVolume,spawn,wpctl set-volume @DEFAULT_AUDIO_SINK@ 0.1-"
        "None,XF86AudioMute,spawn,wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"
        "None,XF86AudioMicMute,spawn,wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"
        # Brightness
        "None,XF86MonBrightnessUp,spawn,xbacklight -inc 10"
        "None,XF86MonBrightnessDown,spawn,xbacklight -dec 10"
        # Powerbutton
        "None,XF86PowerOff,spawn,/home/$USER/.config/eww/scripts/powermenu.sh"
        # Program
        "Super,C,spawn,zen"
        "Super,Y,spawn,signal-desktop"
        "Super,X,spawn,Telegram"
        "Super,V,spawn,thunderbird"
        "Super+Shift,I,spawn,/home/$USER/.config/eww/scripts/idle.sh"

        "Super,1,view,1"
        "Super,2,view,2"
        "Super,3,view,3"
        "Super,4,view,4"
        "Super,5,view,5"
        "Super,6,view,6"
        "Super,7,view,7"
        "Super,8,view,8"
        "Super,9,view,9"

        "Super+Shift,1,tag,1"
        "Super+Shift,2,tag,2"
        "Super+Shift,3,tag,3"
        "Super+Shift,4,tag,4"
        "Super+Shift,5,tag,5"
        "Super+Shift,6,tag,6"
        "Super+Shift,7,tag,7"
        "Super+Shift,8,tag,8"
        "Super+Shift,9,tag,9"

        "Super+Ctrl,1,toggleview,1"
        "Super+Ctrl,2,toggleview,2"
        "Super+Ctrl,3,toggleview,3"
        "Super+Ctrl,4,toggleview,4"
        "Super+Ctrl,5,toggleview,5"
        "Super+Ctrl,6,toggleview,6"
        "Super+Ctrl,7,toggleview,7"
        "Super+Ctrl,8,toggleview,8"
        "Super+Ctrl,9,toggleview,9"

        "Super+Shift+Ctrl,1,toggletag,1"
        "Super+Shift+Ctrl,2,toggletag,2"
        "Super+Shift+Ctrl,3,toggletag,3"
        "Super+Shift+Ctrl,4,toggletag,4"
        "Super+Shift+Ctrl,5,toggletag,5"
        "Super+Shift+Ctrl,6,toggletag,6"
        "Super+Shift+Ctrl,7,toggletag,7"
        "Super+Shift+Ctrl,8,toggletag,8"
        "Super+Shift+Ctrl,9,toggletag,9"
      ];
    };

    autostart_sh = ''
      /home/${config.home.username}/.config/helperscripts/startEww.sh
    '';
  };
}
