final: prev: {
  obsidian = prev.obsidian.overrideAttrs (old: {

    src = prev.fetchurl {
      url = old.src.url;
      hash = "sha256-6IHqBvZx2yxQAvADi3Ok5Le3ip2/c6qafQ3FSpPT0po=";
    };
  });
}

