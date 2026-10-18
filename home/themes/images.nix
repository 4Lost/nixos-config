{ ... }:

let
  commit = "2a625958d61bdac8a100e22a37431f3550817f5c";
  baseUrl = "https://raw.githubusercontent.com/4Lost/nixos-images/${commit}/";
in
{
  lock = builtins.fetchurl {
    url = "${baseUrl}lockpaper.png";
    sha256 = "sha256:1a5yd20yrxi6h5ni4wwjwzgkkssw7bmiaj92g9ip2q5d1bgjq790";
  };
  face = builtins.fetchurl {
    url = "${baseUrl}face.icon";
    sha256 = "sha256:1c1qxx7vbmyz244qryk96izsa2r5zlhrzkrsjixk4ds0zzah92ms";
  };
  background = builtins.fetchurl {
    url = "${baseUrl}wallpaper.jpeg";
    sha256 = "sha256:0hgnjwfdhkkhlnpglm15z52w7hdhpbp7sn3s5qvldng86lmzj6fz";
  };
}
