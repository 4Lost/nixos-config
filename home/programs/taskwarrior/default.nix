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
    dataLocation = "~/Nextcloud/tasks";
    config = {
      uda.parentName = {
        type = "string";
        label = "Parent";
      };
      report.projall = {
        description = "All tasks grouped by projet";
        columns = [
          "id"
          "project.indented"
          "depends"
          "tags"
          "due"
          "description"
          "urgency"
          "start.age"
        ];
        labels = [
          "ID"
          "Project"
          "Deps"
          "Tag"
          "Due"
          "Description"
          "Urgency"
          "Age"
        ];
        sort = [
          "parentName+\\/"
          "project+"
        ];
        filter = "status:pending";
      };
    };
  };

  home.file.".local/share/task/hooks/on-modify.timewarrior" = {
    executable = true;
    source = "${pkgs.timewarrior}/share/doc/timew/ext/on-modify.timewarrior";
  };

  home.file."Nextcloud/tasks/hooks/on-add.sh" = {
    executable = true;
    source = ./hooks/on-add.sh;
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
