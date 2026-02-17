{ pkgs, ... }:

{
  home.packages = with pkgs; [
    timewarrior
    tasksh
    taskopen
    # syncall
    taskwarrior-tui
  ];

  programs.taskwarrior = {
    enable = true;
    colorTheme = ./catppuccin.theme;
    package = pkgs.taskwarrior3;
  };

  home.file.".local/share/task/hooks/on-modify.timewarrior" = {
    executable = true;
    source = "${pkgs.timewarrior}/share/doc/timew/ext/on-modify.timewarrior";
  };

  # TODO: This need the python package timew-report, pyfzf and plumbum
  # home.file.".config/timewarrior/extensions/twfzf.py" = {
  #   source = builtins.fetchurl {
  #     url = "https://raw.githubusercontent.com/oivvio/timew-fzf/refs/heads/main/twfzf.py";
  #     sha256 = "0hrxz8bkvw3i6r4li829f60wzvgj8fqzv706gvlj66lad5fa5gdb";
  #   };
  #   executable = true;
  # };
}
