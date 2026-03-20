{ ... }:

{
  lock = builtins.fetchurl {
    url = "https://github.com/4Lost/nixos-images/raw/refs/heads/main/lockpaper.png";
    sha256 = "sha256:1a5yd20yrxi6h5ni4wwjwzgkkssw7bmiaj92g9ip2q5d1bgjq790";
  };
  face = builtins.fetchurl {
    url = "https://github.com/4Lost/nixos-images/raw/refs/heads/main/face.icon";
    sha256 = "sha256:1c1qxx7vbmyz244qryk96izsa2r5zlhrzkrsjixk4ds0zzah92ms";
  };
  background = builtins.fetchurl {
    url = "https://github.com/4Lost/nixos-images/raw/refs/heads/main/wallpaper.jpeg";
    sha256 = "sha256:0hgnjwfdhkkhlnpglm15z52w7hdhpbp7sn3s5qvldng86lmzj6fz";
  };
}
