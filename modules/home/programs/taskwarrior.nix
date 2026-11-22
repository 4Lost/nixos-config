{ ... }:

{
  flake.modules.homeManager.taskwarrior =
    { pkgs, ... }:

    {
      home.packages = with pkgs; [
        timewarrior
        tasksh
        # taskopen
        # syncall
        taskwarrior-tui
      ];

      programs.taskwarrior = {
        enable = true;
        package = pkgs.taskwarrior3;
        dataLocation = "~/Nextcloud/.tasks";
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

      home.file."Nextcloud/.tasks/hooks/on-add.sh" = {
        executable = true;
        text = ''
          #!/usr/bin/env bash
          read -r json
          project=$(echo "$json" | jq -r '.project // empty')
          [[ -n "$project" ]] && parent=$(echo "$project" | cut -d. -f1 || echo "$project") || parent=""
          echo "$json" | jq -c --arg p "$parent" '.parentName = $p'
        '';
      };
    };
}
