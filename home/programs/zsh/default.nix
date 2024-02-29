{ pkgs, config, ... }:

{
  home.packages = with pkgs; [
    zsh
    python3
    zsh-nix-shell
    nix-zsh-completions
  ];

  programs.zsh = {
    enable = true;
    dotDir = ".config/zsh";
    shellAliases = {
      update = "sudo nixos-rebuild switch";
    };
    enableAutosuggestions = true;
    enableCompletion = true;
    enableVteIntegration = true;
    history = {
      expireDuplicatesFirst = true;
      size = 100000000000;
      path = "${config.xdg.dataHome}/zsh/zsh_history";
    };
    syntaxHighlighting = {
      enable = true;
    };
    initExtra = ''
      source ~/.config/zsh/zsh-history-substring-search.zsh
      source ~/.config/zsh/zsh-syntax-highlighting.zsh

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
        "tmux"
        "tmux-cssh"
        "tmuxinator"
        "vi-mode"
        "web-search"
        "zsh-interactive-cd"
      ];
    };
  };

  #xdg.configFile = {
  #  "zsh/zsh-syntax-highlighting" = {
  #    source = ./zsh-syntax-highlighting.zsh;
  #  };
  #  "zsh/zsh-history-substring-search" = {
  #    source = ./zsh-history-substring-search.zsh;
  #  };
  #};
}
