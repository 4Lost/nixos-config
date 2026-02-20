{ pkgs, ... }:

# TODO: Make filetype keybindings work
let
  keys = [
    {
      action.__raw = "function() require('knap').close_viewer() end";
      key = "<C-k>c";
      mode = [
        "n"
        "v"
        "i"
      ];
      options = {
        desc = "Close Viewer (knap)";
      };
    }
    {
      action.__raw = "function() require('knap').toggle_autopreviewing() end";
      key = "<C-k>k";
      mode = [
        "n"
        "v"
        "i"
      ];
      options = {
        desc = "Toggle Auto-Processing (knap)";
      };
    }
    {
      action.__raw = "function() require('knap').forward_jump() end";
      key = "<C-k>s";
      mode = [
        "n"
        "v"
        "i"
      ];
      options = {
        desc = "SyncTeX Forward Search (Knap)";
      };
    }
  ];
in
{
  home.packages = with pkgs; [
    pandoc
    texliveFull
    rubber
  ];
  programs.nixvim = {
    extraPlugins = with pkgs.vimPlugins; [ knap ];
    globals = {
      knap_settings = {
        htmltohtmlviewerlaunch = "luakit %outputfile%";
        mdtohtmlviewerlaunch = "luakit %outputfile%";
        markdowntohtmlviewerlaunch = "luakit %outputfile%";
      };
    };
    files = {
      "ftplugin/latex.lua" = {
        keymaps = keys;
      };
      "ftplugin/markdown.lua" = {
        keymaps = keys;
      };
    };
  };
}
