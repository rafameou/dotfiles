{ pkgs, ... }:
{
  /*link .config/sway/config to /.config/lxqt/wayland/lxqt-sway.config*/
  xdg.configFile."lxqt/wayland/lxqt-sway.config".text = ''
      include ~/.config/sway/*
    '';

  # configure panel...
}
