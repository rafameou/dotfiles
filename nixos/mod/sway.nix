{ pkgs, ... }:
{
  services.xserver.displayManager.startx.enable = true;
  #Enable Keyring for stuff like github-desktop
  services.gnome.gnome-keyring.enable = true;
  programs.seahorse.enable = true;

  # pcmanfm
  services.udisks2.enable = true;
  services.gvfs.enable = true; 

  # thumbnails
  services.tumbler.enable = true;
  environment.systemPackages = with pkgs; [
    gdk-pixbuf
    webp-pixbuf-loader
    poppler
    ffmpegthumbnailer
    freetype
    libgsf
    gnome.totem #caja
    gnome-epub-thumbnailer
    f3d
  ];

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
