{ pkgs, config, ... }:

{
  home.packages = with pkgs; [ nextcloud-client ];
}
