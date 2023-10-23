{ inputs, lib, config, pkgs, ... }:
{
  home.packages = with pkgs; [
    gnome.dconf-editor

    libsForQt5.kate
    
    libsForQt5.oxygen
    libsForQt5.oxygen-sounds
    libsForQt5.oxygen-icons5
  ];
}
