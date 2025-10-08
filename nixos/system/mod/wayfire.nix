{ inputs, pkgs, ... }:
{
  programs.wayfire = {
    enable = true;
    plugins = with pkgs.wayfirePlugins; [
      wf-shell
      wayfire-plugins-extra
    ];
  };
}
