{ ... }:

{
  login = builtins.fetchurl {
    url =
      "https://github.com/zhichaoh/catppuccin-wallpapers/blob/main/minimalistic/unicat.png?raw=true";
    sha256 = "1pa0mlnzna96d0gkrc9yphg11vmjdxvk5vyj8h5jq4ngsm20p6cy";
  };

  lock = builtins.fetchurl {
    url =
      "https://github.com/zhichaoh/catppuccin-wallpapers/blob/main/landscapes/yosemite.png?raw=true";
    sha256 = "0zyphcvh6dxbq997h716lcr2kpilp4jid9hp2sdjphpxpf824nck";
  };
}

