{ inputs, lib, config, pkgs, ... }:
{
  home.packages = with pkgs; [
    gnome.dconf-editor
  ];
}
