{ inputs, self, ... }:

{
  flake.modules.homeManager.catppuccin =
    { ... }:

    {
      imports = with self.modules.homeManager; [
        inputs.catppuccin.homeModules.catppuccin
        catppuccin-cursor
        catppuccin-fnott
        # catppuccin-gtk
        catppuccin-hyprlock
        catppuccin-nixvim
        catppuccin-taskwarrior
        catppuccin-zathura
      ];

      catppuccin = {
        enable = true;
        autoEnable = false;
        flavor = "mocha";
        accent = "pink";

        anki.enable = true;
        element-desktop.enable = true;
        firefox.enable = true;
        fzf.enable = true;
        imv.enable = true;
        kitty.enable = true;
        lazygit.enable = true;
        qt5ct.enable = true;
        rofi.enable = true;
        spotify-player.enable = true;
        thunderbird.enable = true;
        vscodium.profiles.default.enable = true;
        yazi.enable = true;
        zsh-syntax-highlighting.enable = true;
      };

      # ── Icon for Lock & Loginscreen ───────────────────────────────────────
      xdg.configFile.".face.icon".source = "${inputs.images.face}";
    };
}
