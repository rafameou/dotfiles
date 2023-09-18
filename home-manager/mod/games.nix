{ inputs, lib, config, pkgs, ... }:
{
  home.packages = with pkgs; [
    easyrpg-player
    crispy-doom
    prboom-plus
  ];
}