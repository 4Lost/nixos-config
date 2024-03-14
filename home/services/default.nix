{ pkgs, ... }:

{
  imports = [ ./ssh-agent.nix ./gpg-agent.nix ./xscreenlocker.nix ];
}
