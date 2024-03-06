{ pkgs, ... }:
{
  #services.xserver.displayManager.lightdm.enable = true;
  services.xserver.desktopManager.mate.enable = true;

  services.gnome.gnome-keyring.enable = true;

  services.xrdp.enable = true;
  services.xrdp.defaultWindowManager = "mate-session";
  #services.xrdp.openFirewall = true;

  # flatpak
  xdg.portal = {
    enable = true;
    extraPortals = [ pkgs.xdg-desktop-portal-gtk ];
    config.common.default = "*";
  };
}
