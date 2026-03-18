{ config, ... }:

let
  emanote = import (
    builtins.fetchTarball {
      url = "https://github.com/srid/emanote/archive/master.tar.gz";
      sha256 = "0kr8bbq1awg2c2ra1mwjxqa9m7is9b6cdksvh48g4w354h5pqbnv";
    }
  );
in
{
  imports = [ emanote.homeManagerModule ];
  services.emanote = {
    enable = true;
    # host = "127.0.0.1"; # default listen address is 127.0.0.1
    # port = 7000;        # default http port is 7000
    notes = [
      "/home/elias/zettelkasten"
    ];
    # TODO: currentSystem
    package = emanote.packages."x86_64-linux".default;
  };
}
