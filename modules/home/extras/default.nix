{ self, ... }:

{
  flake.modules.homeManager.extras =
    { ... }:

    {
      imports = with self.modules.homeManager; [
        sops
      ];
    };
}
