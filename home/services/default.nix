{ ... }:

{
  imports = [
    ./ssh-agent.nix
    ./gpg-agent.nix
    ./hypridle.nix
    ./nextcloud.nix
  ];
}
