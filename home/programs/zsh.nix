{ pkgs, config, ... }:

{
  home.packages = with pkgs; [
    fzf
    python3
    zsh-nix-shell
    nix-zsh-completions
    fastfetch
  ];

  programs.zsh = {
    enable = true;
    dotDir = "${config.xdg.configHome}/zsh";
    shellAliases = {
      update = "sudo nixos-rebuild switch";
    };
    autosuggestion.enable = true;
    localVariables = {
      EDITOR = "nvim";
      SOPS_AGE_KEY_FILE = "/etc/sops/keys.txt";
    };
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
    initContent = ''
      export LD_LIBRARY_PATH="/nix/store/yjm4j9n85bcp42v5nkz2xifrp4a9s63k-sqlite-3.46.1/lib"
      export CHROME_EXECUTABLE="/run/current-system/sw/bin/google-chrome-stable"
      export SOPS_AGE_KEY_FILE="/etc/sops/key.txt"
      fastfetch

      PROMPT='%F{green}%n%f@%F{magenta}%m%f %F{blue}%B%~%b%f %# '
      RPROMPT='[%F{yellow}%?%f]'
      bindkey "^[[A" history-beginning-search-backward
      bindkey "^[[B" history-beginning-search-forward

      # trep: tree projall report - top-level projects with headers
      trep() {
        project() {
          echo -e "\e[1;34m/----- Project $1 -----\e[0m"
          task projall "project:$1"
          echo ""
        }
        while IFS= read -r proj; do
          project "$proj"
        done < <(task _projects | grep -v '\.')
      }

      alias trep='trep'
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
