# Arguments to the overlay function:
{ ... }:
final: prev: {
  minlog = prev.callPackage ./minlog.nix { };
}

