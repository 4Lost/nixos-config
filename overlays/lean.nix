final: prev: {
  lean4 = prev.lean4.overrideAttrs (old: rec {
    version = "4.6.1";

    src = prev.fetchFromGitHub {
      owner = "leanprover";
      repo = "lean4";
      rev = "v${version}";
      hash = "sha256-wUqGADwSocg2ciycCxg9qp+vJLJ2otA/5JpTrkFrDoQ=";
    };
  });
}

