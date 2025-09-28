{ inputs, pkgs, ... }:
{
  programs.labwc.enable = true;
  environment.systemPackages = with pkgs; [
    labwc-tweaks
    labwc-gtktheme
    openbox
  ];
}
