{ self, ... }:

{
  flake.modules.homeManager.programs-laptop =
    { ... }:

    {
      imports = with self.modules.homeManager; [
        mango-laptop
      ];
    };
}
