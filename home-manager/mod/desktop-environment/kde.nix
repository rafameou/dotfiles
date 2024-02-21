{ inputs, lib, config, pkgs, ... }:
{
  home.packages = with pkgs; [
    gnome.dconf-editor
    
    libsForQt5.oxygen
    libsForQt5.oxygen-sounds
    libsForQt5.oxygen-icons5

    kde-gruvbox
    gruvbox-dark-gtk

    /* -- for neovim --*/
    wl-clipboard

    /* -- apps --*/
    libsForQt5.kpat
    libsForQt5.kmines
    libsForQt5.kmines

    libsForQt5.kcalc
    libsForQt5.kalk
    libsForQt5.discover

    kaffeine
  ];
}
