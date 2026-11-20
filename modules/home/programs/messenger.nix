{ ... }:

{
  flake.modules.homeManager.messenger =
    { pkgs, ... }:

    {
      home.packages = with pkgs; [
        discord
        signal-desktop
        telegram-desktop
        whatsie
      ];
    };
}
