{ ... }:
{
  programs.nixvim.plugins = {
    smart-splits = {
      enable = true;
    };
  };
  programs.nixvim.keymaps = [
    {
      action.__raw = "require('smart-splits').move_cursor_left";
      key = "<C-S-p>h";
      mode = "n";
    }
    {
      action.__raw = "require('smart-splits').move_cursor_right";
      key = "<C-S-p>l";
      mode = "n";
    }
    {
      action.__raw = "require('smart-splits').move_cursor_down";
      key = "<C-S-p>j";
      mode = "n";
    }
    {
      action.__raw = "require('smart-splits').move_cursor_up";
      key = "<C-S-p>k";
      mode = "n";
    }
    {
      action.__raw = "require('smart-splits').resize_left";
      key = "<C-S-r>h";
      mode = "n";
    }
    {
      action.__raw = "require('smart-splits').resize_right";
      key = "<C-S-r>l";
      mode = "n";
    }
    {
      action.__raw = "require('smart-splits').resize_down";
      key = "<C-S-r>j";
      mode = "n";
    }
    {
      action.__raw = "require('smart-splits').resize_up";
      key = "<C-S-r>k";
      mode = "n";
    }
    {
      action = "<CMD>silent !kitten @ launch --location=hsplit<CR>";
      key = "<C-S-p>s";
      mode = [
        "n"
        "v"
        "i"
      ];
    }
    {
      action = "<CMD>silent !kitten @ launch --location=vsplit<CR>";
      key = "<C-S-p>v";
      mode = [
        "n"
        "v"
        "i"
      ];
    }
    {
      action = "<CMD>silent !kitten @ launch --location=hsplit --cwd=current --bias=35<CR>";
      key = "<C-S-p>p";
      mode = [
        "n"
        "v"
        "i"
      ];
    }
    {
      action = "<CMD>silent !kitten @ close-window<CR>";
      key = "<C-S-p>q";
      mode = [
        "n"
        "v"
        "i"
      ];
    }
    {
      action = "<CMD>silent !kitten @ action layout_action rotate<CR>";
      key = "<C-S-p>r";
      mode = [
        "n"
        "v"
        "i"
      ];
    }
    {
      action = "<CMD>silent !kitten @ action toggle_layout stack<CR>";
      key = "<C-S-p>f";
      mode = [
        "n"
        "v"
        "i"
      ];
    }
  ];
}
