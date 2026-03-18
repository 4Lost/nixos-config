{
  inputs,
  ...
}:

{
  imports = [
    ./cursor.nix
    ./gtk.nix
    ./hyprlock.nix
    ./nvim.nix
    ./taskwarrior.nix
  ];

  catppuccin = {
    enable = false;
    flavor = "mocha";
    accent = "pink";

    anki.enable = true;
    dunst.enable = true;
    element-desktop.enable = true;
    firefox.enable = true;
    fzf.enable = true;
    imv.enable = true;
    kitty.enable = true;
    lazygit.enable = true;
    rofi.enable = true;
    spotify-player.enable = true;
    thunderbird.enable = true;
    vscode.profiles.default.enable = true;
    zathura.enable = true;
    zsh-syntax-highlighting.enable = true;
  };

  # ── Icon for Lock & Loginscreen ───────────────────────────────────────
  xdg.configFile.".face.icon".source = inputs.images + /face.icon;
}
