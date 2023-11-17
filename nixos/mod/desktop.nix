{ inputs, lib, config, pkgs, ... }:
{
  # Enable the X11 windowing system.
  services.xserver.enable = true;

  # Configure keymap in X11
  services.xserver = {
    layout = "br";
    xkbVariant = "";
  };

  #dconf
  programs.dconf.enable = true;

  services.onedrive.enable = true;

  # flatpak
  xdg.portal = {
    enable = true;
    wlr.enable = true;
    extraPortals = [ pkgs.xdg-desktop-portal-gtk ];
  };

  services.flatpak.enable = true;

  #fonts, move to home maybe
  fonts.fontDir.enable = true;
  fonts.packages = with pkgs; [
    roboto
    nerdfonts
    inter
  ];

  # Enable touchpad support (enabled default in most desktopManager).
  # services.xserver.libinput.enable = true;
}
