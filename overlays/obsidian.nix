final: prev: {
  obsidian = prev.obsidian.overrideAttrs (old: {

    src = prev.fetchurl {
      url = old.src.url;
      hash = "sha256-XVq0nQiyT2HvKQpzJIvhghsGgg4ye7uqZcyA1nH4O/o=";
    };
  });
}

