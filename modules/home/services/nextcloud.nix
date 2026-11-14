{ pkgs, ... }:

{
  flake.modules.homeManager.nextcloud =
    { ... }:

    {
      home.packages = with pkgs; [ nextcloud-client ];

      services.nextcloud-client = {
        enable = true;
        startInBackground = true;
      };
    };
}
