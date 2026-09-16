{ ... }:

{
  lock = builtins.fetchurl {
    url = "https://github.com/4Lost/nixos-images/blob/2a625958d61bdac8a100e22a37431f3550817f5c/lockpaper.png";
    sha256 = "sha256:1a5yd20yrxi6h5ni4wwjwzgkkssw7bmiaj92g9ip2q5d1bgjq790";
  };
  face = builtins.fetchurl {
    url = "https://github.com/4Lost/nixos-images/blob/2a625958d61bdac8a100e22a37431f3550817f5c/face.icon";
    sha256 = "sha256:1c1qxx7vbmyz244qryk96izsa2r5zlhrzkrsjixk4ds0zzah92ms";
  };
  background = builtins.fetchurl {
    url = "https://github.com/4Lost/nixos-images/blob/2a625958d61bdac8a100e22a37431f3550817f5c/wallpaper.jpeg";
    sha256 = "sha256:0hgnjwfdhkkhlnpglm15z52w7hdhpbp7sn3s5qvldng86lmzj6fz";
  };
}
