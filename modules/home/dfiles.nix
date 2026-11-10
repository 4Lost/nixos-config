{ inputs, pkgs, ... }:

let
  dfilesSettings = pkgs.writeText "dfiles-ui-settings.json" (
    builtins.toJSON {
      themeMode = "dark";
      defaultView = "list";
      vimKeys = true;
    }
  );
in
{
  systemd.tmpfiles.rules = [
    "d /home/elias/.config/dfiles 0755 elias users -"
    "L+ /home/elias/.config/dfiles/ui-settings.json - - - - ${dfilesSettings}"
  ];

  programs.dux-files = {
    enable = true;

    package = inputs.dfiles.packages.${pkgs.stdenv.hostPlatform.system}.default;

    quickshell.package = pkgs.quickshell;

    systemd = {
      enable = true;
      target = "graphical-session.target";
      restartIfChanged = true;
    };
  };
}
