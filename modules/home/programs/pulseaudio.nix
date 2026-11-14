{ ... }:

{
  flake.modules.homeManager.pulseaudio =
    { ... }:

    {
      xdg.configFile."pulseaudio-ctl/config".text = "UPPER_THRESHOLD=200";
    };
}
