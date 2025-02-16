final: prev: {
  obsidian = prev.obsidian.overrideAttrs (old: {

    src = prev.fetchurl {
      url = old.src.url;
      hash = "sha256-bvmvzVyHrjh1Yj3JxEfry521CMX3E2GENmXddEeLwiE=";
    };
  });
}

