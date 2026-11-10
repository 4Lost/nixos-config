{
  inputs,
  ...
}:

{
  imports = [
    inputs.mangowm.hmModules.mango
    ./default.nix
  ];

  wayland.windowManager.mango.settings = {
    gap_inner_horizontal = 5;
    gap_inner_vertical = 5;
    gap_outer_horizontal = 0;
    gap_outer_vertical = 0;
  };
}
