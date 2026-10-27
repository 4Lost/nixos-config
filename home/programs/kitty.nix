{ pkgs, ... }:

{
  home.packages = with pkgs; [
    imagemagick
  ];

  home.sessionVariables = {
    TERMINAL = "${pkgs.kitty}/bin/kitty";
  };

  programs.kitty = {
    enable = true;
    font = {
      size = 8;
      name = "Fira Code";
      package = pkgs.fira-code;
    };
    settings = {
      clear_all_shortcuts = true;
      enabled_layouts = "splits:slit_axis=horizontal,stack";
      enable_audio_bell = false;
      cursor_shape = "underline";
      confirm_os_window_close = 0;
      allow_remote_control = true;
      listen_on = "unix:/tmp/kitty";
      shell_integration = true;
      tab_bar_min_tabs = 1;
      tab_bar_style = "powerline";
    };
    actionAliases = {
      kitty_scrollback_nvim = "kitten ${pkgs.vimPlugins.kitty-scrollback-nvim}/python/kitty_scrollback_nvim.py --nvim-args --noplugin -n";
    };
    keybindings = {
      "ctrl+shift+c" = "copy_to_clipboard";
      "ctrl+shift+v" = "paste_from_clipboard";

      "ctrl+shift+h" = "kitty_scrollback_nvim";
      "ctrl+shift+g" = "kitty_scrollback_nvim --config ksb_builtin_last_cmd_output";

      "ctrl+shift+u" = "input_unicode_character";

      # WINDOWS
      "ctrl+shift+p>j" = "neighboring_window down";
      "ctrl+shift+p>k" = "neighboring_window up";
      "ctrl+shift+p>h" = "neighboring_window left";
      "ctrl+shift+p>l" = "neighboring_window right";

      "ctrl+shift+r>j" = "kitten relative_resize.py down  3";
      "ctrl+shift+r>k" = "kitten relative_resize.py up    3";
      "ctrl+shift+r>h" = "kitten relative_resize.py left  3";
      "ctrl+shift+r>l" = "kitten relative_resize.py right 3";

      "ctrl+shift+p>shift+h" = "move_window left";
      "ctrl+shift+p>shift+l" = "move_window right";
      "ctrl+shift+p>shift+j" = "move_window down";
      "ctrl+shift+p>shift+k" = "move_window up";

      "ctrl+shift+p>s" = "launch --location=hsplit";
      "ctrl+shift+p>v" = "launch --location=vsplit";
      "ctrl+shift+p>p" = "launch --location=hsplit --cwd=current --bias=35";
      "ctrl+shift+p>r" = "layout_action rotate";

      "ctrl+shift+p>f" = "toggle_layout stack";
      "ctrl+shift+p>q" = "close_window";

      # TABS
      "ctrl+shift+t>l" = "next_tab";
      "ctrl+shift+t>h" = "previous_tab";
      "ctrl+shift+t>n" = "new_tab";
      "ctrl+shift+t>q" = "close_tab";
      "ctrl+shift+t>r" = "set_tab_title";
      "ctrl+shift+t>s" = "select_tab";

      "ctrl+shift+t>shift+l" = "move_tab_forward";
      "ctrl+shift+t>shift+h" = "move_tab_backward";
    };
    extraConfig = ''
      mouse_map ctrl+shift+right press ungrabbed combine : mouse_select_command_output : kitty_scrollback_nvim --config ksb_builtin_last_visited_cmd_output

        # Unset the mapping to pass the keys to neovim
        map --when-focus-on var:IS_NVIM ctrl+shift+p>j
        map --when-focus-on var:IS_NVIM ctrl+shift+p>k
        map --when-focus-on var:IS_NVIM ctrl+shift+p>h
        map --when-focus-on var:IS_NVIM ctrl+shift+p>l

        map --when-focus-on var:IS_NVIM ctrl+shift+r>j
        map --when-focus-on var:IS_NVIM ctrl+shift+r>k
        map --when-focus-on var:IS_NVIM ctrl+shift+r>h
        map --when-focus-on var:IS_NVIM ctrl+shift+r>l
    '';
    shellIntegration.enableZshIntegration = true;
  };
}
