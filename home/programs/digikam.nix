{ pkgs, ... }:

{
  home.packages = with pkgs; [ digikam sqlite ];
}
