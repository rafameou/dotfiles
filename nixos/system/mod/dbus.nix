{ pkgs, ... }:
{
  services.dbus.enable = true;
  xdg.portal = {
    enable = true;
    wlr.enable = true;
    extraPortals = [ pkgs.xdg-desktop-portal-gnome pkgs.kdePackages.xdg-desktop-portal-kde ];
    config.common.default = "*";
  };
}
