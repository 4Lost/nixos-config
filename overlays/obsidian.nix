final: prev: {
  obsidian = prev.obsidian.overrideAttrs (old: {

    src = prev.fetchurl {
      url = old.src.url;
      hash = "sha256-9goJnKOgJk5TrFUNz4vff8704cvHfqZpGL/iBkcU2GY=";
    };
  });
}

