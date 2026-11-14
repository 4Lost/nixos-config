{ self, ... }:

{
  flake.modules.homeManager.programs-desktop =
    { ... }:

    {
      imports = with self.modules.homeManager; [
        mango-desktop
        games
      ];
    };
}
