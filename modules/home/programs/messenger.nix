{ pkgs, ... }:

{
  flake.modules.homeManager.messenger =
    { ... }:

    {
      home.packages = with pkgs; [
        discord
        signal-desktop
        telegram-desktop
        whatsie
      ];
    };
}
