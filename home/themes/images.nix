{ ... }:

let
  commit = "2a625958d61bdac8a100e22a37431f3550817f5c";
  baseUrl = "https://raw.githubusercontent.com/4Lost/nixos-images/${commit}/";
in
{
  lock = builtins.fetchurl {
    url = "${baseUrl}lockpaper.png";
    sha256 = "201d2cdf0aad6071637a224915eb3a5ceb39dfe79273126d8126f6ec8168bea8";
  };
  face = builtins.fetchurl {
    url = "${baseUrl}face.icon";
    sha256 = "ba8a04d5ff4037327b943acf9f21fd250ba57f3469fa8c0911dfd7b54fef38b0";
  };
  background = builtins.fetchurl {
    url = "${baseUrl}wallpaper.jpeg";
    sha256 = "df19f92b35e8d946372e7a587deebab0c1c345f92554faaea5704ed81c97f641";
  };
}
