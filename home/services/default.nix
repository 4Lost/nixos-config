{ pkgs, ... }:

{
  imports = [ ./ssh-agent ./gpg-agent ];
}
