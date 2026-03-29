{ inputs, pkgs, ... }:

let
  exifaudio = pkgs.fetchFromGitHub {
    owner = "Sonico98";
    repo = "exifaudio.yazi";
    rev = "4506f9d";
    sha256 = "sha256-RWCqWBpbmU3sh/A+LBJPXL/AY292blKb/zZXGvIA5/o=";
  };
  bunny = pkgs.fetchFromGitHub {
    owner = "stelcodes";
    repo = "bunny.yazi";
    rev = "71b14a3";
    sha256 = "sha256-uQO0C00yOFPWq8KEO/kEZM6tFZRc9SiXfgN7kzlwDeA=";
  };
in
{
  home.packages = with pkgs; [
    # kdePackages.dolphin
    # kdePackages.dolphin-plugins
    # kdePackages.baloo-widgets
    # kdePackages.baloo
    exiftool
    nautilus
    ouch
    udisks
  ];
  xdg.configFile."menus/applications.menu".source =
    "${pkgs.kdePackages.plasma-workspace}/etc/xdg/menus/plasma-applications.menu";

  # ── Yazi ──────────────────────────────────────────────────────────────
  programs.yazi = {
    enable = true;
    package = inputs.yazi.packages.${pkgs.stdenv.hostPlatform.system}.default;
    enableZshIntegration = true;
    initLua = ./init.lua;

    settings = {
      yazi = {
        ratio = [
          1
          4
          3
        ];
        sort_by = "natural";
        sort_sensitive = true;
        sort_reverse = false;
        sort_dir_first = true;
        linemode = "none";
        show_hidden = true;
        show_symlink = true;
      };

      preview = {
        image_filter = "lanczos3";
        image_quality = 90;
        tab_size = 1;
        max_width = 600;
        max_height = 900;
        cache_dir = "";
        ueberzug_scale = 1;
        ueberzug_offset = [
          0
          0
          0
          0
        ];
      };

      tasks = {
        micro_workers = 5;
        macro_workers = 10;
        bizarre_retry = 5;
      };

      plugin = {
        prepend_previewers = [
          {
            run = "exifaudio";
            mime = "audio/*";
          }
        ];
        prepend_fetchers = [
          {
            id = "git";
            url = "*";
            run = "git";
          }
          {
            id = "git";
            url = "*/";
            run = "git";
          }
        ];
      };

      opener = {
        extract = [
          {
            run = "ouch d -y %*";
            desc = "Extract here with ouch";
            for = "windows";
          }
          {
            run = "ouch d -y $@";
            desc = "Extract here with ouch";
            for = "unix";
          }
        ];
      };
    };

    keymap = {
      mgr.prepend_keymap = [
        {
          run = "plugin mount";
          on = [ "M" ];
        }
        {
          run = "plugin ouch";
          on = [ "C" ];
        }
        {
          run = "plugin bunny";
          on = [
            ";"
          ];
          desc = "Start bunny";
        }
        {
          run = "plugin bunny fuzzy";
          on = [
            "'"
          ];
          desc = "Start bunny fuzzy search";
        }
        {
          run = "plugin chmod";
          on = [
            "c"
            "m"
          ];
          desc = "Chmod on selected files";
        }
        {
          run = "plugin sudo -- paste";
          on = [
            "R"
            "p"
            "p"
          ];
          desc = "sudo paste";
        }
        {
          run = "plugin sudo -- paste --force";
          on = [
            "R"
            "P"
          ];
          desc = "sudo paste";
        }
        {
          run = "plugin sudo -- rename";
          on = [
            "R"
            "r"
          ];
          desc = "sudo rename";
        }
        {
          run = "plugin sudo -- link";
          on = [
            "R"
            "p"
            "l"
          ];
          desc = "sudo link";
        }
        {
          run = "plugin sudo -- link --relative";
          on = [
            "R"
            "p"
            "r"
          ];
          desc = "sudo link relative path";
        }
        {
          run = "plugin sudo -- hardlink";
          on = [
            "R"
            "p"
            "L"
          ];
          desc = "sudo hardlink";
        }
        {
          run = "plugin sudo -- create";
          on = [
            "R"
            "a"
          ];
          desc = "sudo create";
        }
        {
          run = "plugin sudo -- remove";
          on = [
            "R"
            "d"
          ];
          desc = "sudo trash";
        }
        {
          run = "plugin sudo -- remove --permanently";
          on = [
            "R"
            "D"
          ];
          desc = "sudo delete";
        }
        {
          run = "plugin sudo -- chmod";
          on = [
            "R"
            "m"
          ];
          desc = "sudo chmod";
        }
        {
          run = [ "plugin wl-clipboard" ];
          on = [ "<C-y" ];
        }
      ];
    };

    plugins = {
      bunny = bunny;
      chmod = pkgs.yaziPlugins.chmod;
      exifaudio = exifaudio;
      git = pkgs.yaziPlugins.git;
      mount = pkgs.yaziPlugins.mount;
      ouch = pkgs.yaziPlugins.ouch;
      sudo = pkgs.yaziPlugins.sudo;
      wl-clipboard = pkgs.yaziPlugins.wl-clipboard;
    };
  };

  programs.zoxide = {
    enable = true;
    enableZshIntegration = true;
  };
}
