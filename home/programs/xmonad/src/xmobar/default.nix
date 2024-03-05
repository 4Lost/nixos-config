{ pkgs ? import <nixpkgs> { } }:
with pkgs;
haskellPackages.mkDerivation {
  pname = "xmobar";
  version = "0.1.0.0";
  src = /etc/nixos/home/programs/xmonad/src/xmobar/.;
  isLibrary = false;
  isExecutable = true;
  executableHaskellDepends = with haskellPackages; [ base xmobar ];
  license = "unknown";
  hydraPlatforms = lib.platforms.none;
}

