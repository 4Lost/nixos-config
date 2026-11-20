{ ... }:

{
  flake.modules.homeManager.nextcloud =
    { pkgs, ... }:

    {
      home.packages = with pkgs; [ nextcloud-client ];

      services.nextcloud-client = {
        enable = true;
        startInBackground = true;
      };
    };
}
