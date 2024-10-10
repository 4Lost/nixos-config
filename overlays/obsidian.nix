final: prev: {
  obsidian = prev.obsidian.overrideAttrs (old: {

    src = prev.fetchurl {
      url = old.src.url;
      hash = "sha256-ok1fedN8+OXBisFpVXbKRW2OhE4o9MC9lJmtMMST6V8=";
    };
  });
}

