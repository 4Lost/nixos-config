{ pkgs, config, ... }:

{
  home.packages = with pkgs; [
    fzf
    python3
    zsh-nix-shell
    nix-zsh-completions
    neofetch
  ];

  programs.zsh = {
    enable = true;
    dotDir = ".config/zsh";
    shellAliases = {
      update = "sudo nixos-rebuild switch";
      conWG = "ssh elias@logout.nonagon.dev -p 6969";
      conWS = "ssh elias@192.168.31.200";
      setupPC = "wlr-randr --output HDMI-A-2 --on --mode 1920x1080 --pos 0,0;wlr-randr --output DVI-D-1 --on --mode 1920x1080 --pos 1920,0;wlr-randr --output DP-2 --on --mode 1920x1080 --pos 3840,0 --primary";
    };
    autosuggestion.enable = true;
    enableCompletion = true;
    enableVteIntegration = true;
    history = {
      expireDuplicatesFirst = true;
      size = 100000000000;
      path = "${config.xdg.dataHome}/zsh/zsh_history";
    };
    syntaxHighlighting = { enable = true; };
    initContent = ''
      export LD_LIBRARY_PATH="/nix/store/yjm4j9n85bcp42v5nkz2xifrp4a9s63k-sqlite-3.46.1/lib"o
      export CHROME_EXECUTABLE="/run/current-system/sw/bin/google-chrome-stable"
      neofetch

      PROMPT='%F{green}%n%f@%F{magenta}%m%f %F{blue}%B%~%b%f %# '
      RPROMPT='[%F{yellow}%?%f]'
      bindkey "^[[A" history-beginning-search-backward
      bindkey "^[[B" history-beginning-search-forward
    '';
    plugins = [
      {
        name = "zsh-nix-shell";
        file = "nix.shell.plugins.zsh";
        src = "${pkgs.zsh-nix-shell}/share/zsh-nix-shell";
      }
      {
        name = "nix-zsh-completions";
        src = "${pkgs.nix-zsh-completions}/share/zsh/plugins/nix";
      }
    ];
    oh-my-zsh = {
      enable = true;
      theme = "jonathan";
      plugins = [
        "cabal"
        "colorize"
        "colored-man-pages"
        "cp"
        "copyfile"
        "copypath"
        "fzf"
        "git"
        "gitignore"
        "last-working-dir"
        "sudo"
        "vi-mode"
        "web-search"
        "zsh-interactive-cd"
      ];
    };
  };
}
