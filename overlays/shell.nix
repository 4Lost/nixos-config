{ pkgs ? import <nixpkgs> { overlays = [ (import ./river-status.nix) ]; } }:

pkgs.mkShell {
  buildInputs = [ pkgs.river-status ];
}
