{ config, ... }:

{
  xdg.configFile."pulseaudio-ctl/config".source = ./config;
}
