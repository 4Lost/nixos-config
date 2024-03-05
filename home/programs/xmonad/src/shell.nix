with (import <nixpkgs> { });
mkShell {
  buildInputs = [
    stack
    cabal-install
    haskell-language-server
    (haskellPackages.ghcWithPackages
      (hpkgs: with hpkgs; [ xmobar xmonad xmonad-contrib ]))
  ];
  shellHook = "zsh";
}

