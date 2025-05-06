{ pkgs, ... }:

{
  imports = [ ./ssh-agent ./gpg-agent ./hypridle.nix ];
}
