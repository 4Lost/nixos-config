{ lib, stdenv, fetchFromGitHub, sddm, qtgraphicaleffects, qtquickcontrols2
, qtsvg }:

stdenv.mkDerivation {
  pname = "catppuccin-sddm";
  version = "unstable-2024-02-05";

  src = fetchFromGitHub {
    owner = "catppuccin";
    repo = "sddm";
    rev = "f3db13cbe8e99a4ee7379a4e766bc8a4c2c6c3dd";
    hash = "sha256-0zoJOTFjQq3gm5i3xCRbyk781kB7BqcWWNrrIkWf2Xk=";
  };

  buildInputs = [ sddm qtgraphicaleffects qtquickcontrols2 qtsvg ];

  dontWrapQtApps = true;

  postInstall = ''
    mkdir -p "$out/share/sddm/themes/"
    mv src/* "$out/share/sddm/themes/."
  '';

  meta = {
    description = "Soothing pastel theme for SDDM";
    homepage = "https://github.com/catppuccin/sddm";
    license = lib.licenses.mit;
    maintainers = with lib.maintainers; [ einfischy ];
    platforms = lib.platforms.linux;
  };
}

