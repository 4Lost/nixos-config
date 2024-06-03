{ lib, stdenv, fetchgit, chez, gnumake, which, emacs, texliveFull }:

stdenv.mkDerivation rec {
  name = "minlog";
  version = "2024-04-24";

  src = fetchgit {
    url = "http://www.ed.math.lmu.de/m/~minlogit/git/minlog.git";
    rev = "92a3f38d4532942016525ebdfb05c0a0791cad97";
    hash = "sha256-WWkYjf0vMf6zhSW9zr1hdV8D1W08l5Y0auMghMhFU68=";
  };

  nativeBuildInputs = [ chez which emacs texliveFull ];
  buildInputs = [ chez ];

  makeFlags = [ "DESTDIR=$(out)" ];

  meta = with lib; {
    description = "Minlog is an interactive proof system";
    homepage = "https://www.ed.math.lmu.de/m//~logik/minlog/#installation";
    maintainers = [ maintainers.einfischy ];
    platforms = platforms.linux;
  };
}

