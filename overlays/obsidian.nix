final: prev: {
  obsidian = prev.obsidian.overrideAttrs (old: {

    src = prev.fetchurl {
      url = old.src.url;
      hash = "sha256-ho8E2Iq+s/w8NjmxzZo/y5aj3MNgbyvIGjk3nSKPLDw=";
    };
  });
}

