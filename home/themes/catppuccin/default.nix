{
  pkgs,
  ...
}:

let
  images = pkgs.callPackage ../images.nix { };
in
{
  imports = [
    ./cursor.nix
    ./fnott.nix
    ./gtk.nix
    ./hyprlock.nix
    ./nvim.nix
    ./taskwarrior.nix
    ./qt.nix
  ];

  catppuccin = {
    enable = false;
    flavor = "mocha";
    accent = "pink";

    anki.enable = true;
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
    yazi.enable = true;
    zathura.enable = true;
    zsh-syntax-highlighting.enable = true;
  };

  # ── Icon for Lock & Loginscreen ───────────────────────────────────────
  xdg.configFile.".face.icon".source = "${images.face}";
}
