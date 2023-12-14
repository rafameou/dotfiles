{ inputs, lib, config, pkgs, ... }:
{
  services.xserver.displayManager.startx.enable = true;

  #Enable Keyring for stuff like github-desktop
  services.gnome.gnome-keyring.enable = true;

  environment.systemPackages = with pkgs; [
      gnome.seahorse
  ];

  services.udisks2.enable = true;

  security.polkit.enable = true;
  security.pam.services.swaylock = {};

  # flatpak
  services.dbus.enable = true;
  xdg.portal = {
    enable = true;
    wlr.enable = true;
    extraPortals = [ pkgs.xdg-desktop-portal-gtk pkgs.xdg-desktop-portal-kde ];
    config.common.default = "*";
    /*config = {
      common = {
        default = [
          "wlr"
        ];
      };
      gnome = {
        default = [
          "gtk"
        ];
        "org.freedesktop.impl.portal.Secret" = [
          "gnome-keyring"
        ];
      };
      kde = {
        default = [
          "kde"
        ];
      };
    };*/
  };
}
