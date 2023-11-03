{ inputs, lib, config, pkgs, ... }:
{
  home.packages = with pkgs; [
    flatpak
    github-desktop
    scrcpy
    geogebra
    octaveFull
    nicotine-plus
    qbittorrent
    neovim
    unar
    unzip
    zip
    xsane
    htop
    nixos-icons
    mesa-demos
  ];
}
