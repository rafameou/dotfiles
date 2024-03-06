{ pkgs, ... }:
{
  servoces.xserver = true;
  services.xserver.displayManager.gdm.enable = true;
  services.xserver.desktopManager.gnome.enable = true;

  services.gnome.gnome-keyring.enable = true;

  services.gnome.gnome-remote-desktop = true;

  /*services.xrdp.enable = true;
  services.xrdp.defaultWindowManager = "gnome-remote-desktop";
  services.xrdp.openFirewall = true;*/

  # flatpak
  xdg.portal = {
    enable = true;
    #extraPortals = [ pkgs.xdg-desktop-portal-gtk ];
    config.common.default = "*";
  };
}
