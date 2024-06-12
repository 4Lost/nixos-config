{ pkgs, config, ... }:

{
  home.packages = with pkgs; [ zlib ];
}
