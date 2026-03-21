{ ... }:

{
  programs.zk = {
    enable = true;
    settings = {
      note.template = "default.md";
      format.markdow = {
        hashtags = true;
        colon-tags = false;
        multiword-tags = false;
      };
      tool.fzf-preview = "bat -p --color always {-1}";
      notebook = {
        dir = "~/Nextcloud/zettelkasten";
      };
      alias = {
        n = "zk new inbox/$@";
        i = "zk edit -x inbox,journals -i";
        ls = "zk list -x inbox,journals $@";
        ed = "zk edit -x inbox,journals $@";
        rm = ''zk list --interactive --quiet --format "{{abs-path}}" --delimiter0 $@ | xargs -0 rm -vf --'';
        recent = "zk edit --sort created- --created-after 'last two weeks' --interactive";
        inbox = "zk edit -t inbox --interactive";
      };
    };
  };

  home.file = {
    "/Nextcloud/zettelkasten/.zk/templates/default.md" = {
      text = ''
        ---
        title: {{ title }}
        date: {{format-date now "long"}}
        tags: [inbox]
        ---
        # {{ title }}

        {{ content }}
      '';
    };
  };
}
