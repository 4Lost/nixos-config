{ pkgs, ... }:

{
  programs.nixvim = {
    extraPackages = with pkgs; [
      haskell.compiler.native-bignum.ghc912
      haskellPackages.haskell-language-server
      haskellPackages.stack
      haskellPackages.fast-tags
      haskellPackages.hoogle
      haskellPackages.haskell-debug-adapter
      haskellPackages.ghci-dap
    ];

    extraPlugins = with pkgs.vimPlugins; [
      haskell-tools-nvim
    ];
  };
}
