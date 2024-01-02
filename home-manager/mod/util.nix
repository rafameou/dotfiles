{ inputs, lib, config, pkgs, ... }:
{
  home.packages = with pkgs; [
    flatpak
    #github-desktop
    gh
    scrcpy
    geogebra
    octaveFull
    nicotine-plus
    qbittorrent
    unar
    unzip
    zip
    xsane
    remmina
    htop
    nixos-icons
    mesa-demos
  ];
}
