{ pkgs, ... }:

{
  flake.modules.homeManager.syncthing =
    { ... }:

    {
      home.packages = with pkgs; [ stc-cli ];

      services.syncthing.enable = true;
    };
}
