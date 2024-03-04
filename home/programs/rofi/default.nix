{ pkgs, ... }:

{
  home.packages = with pkgs; [ oranchelo-icon-theme nerdfonts pass xclip ];

  xsession.initExtra = "setxkbmap de"; # rofi pass needs this to be set

  programs.rofi = {
    enable = true;
    terminal = "${pkgs.alacritty}/bin/alacritty";
    theme = ./theme.rafi;
    extraConfig = {
      mode = "run,drun,window,ssh,network";
      icon-theme = "Oranchelo";
      show-icons = true;
      drun-display-format = "{icon} {name}";
      location = 0;
      disable-history = false;
      hide-scrollbar = true;
      display-drun = "   Apps ";
      display-run = "   Run ";
      display-window = "   Window";
      display-ssh = "  SSH";
      sidebar-mode = true;
    };
    pass = {
      enable = true;
      extraConfig = ''
        EDITOR='rofi-sensible-terminal -e vim'
        clibpoard_backend=xclip
        clip=clipboard
        password_length=32
        default_user="$\{ROFI_PASS_DEFAULT_USER-$(whoami)\}"
      '';
    };
  };
}

