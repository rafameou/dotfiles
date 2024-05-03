{ pkgs, ... }:
{
  services.xserver.displayManager.lightdm.enable = true;
  services.xserver.desktopManager.mate.enable = true;
  services.xserver.desktopManager.mate.enableWaylandSession = true;

  environment.systemPackages = with pkgs; [
    mate.caja-extensions

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

  # flatpak
  xdg.portal = {
    enable = true;
    #extraPortals = [ pkgs.xdg-desktop-portal-gtk ];
    config.common.default = "*";
  };
 
  services.gnome.gnome-keyring.enable = true;
  #security.pam.services.rafameou.kwallet.enable = true;

  # flatpak
  /*xdg.portal = {
    enable = true;
    extraPortals = [ pkgs.xdg-desktop-portal-gtk ];
    config.common.default = "*";
  };*/
}
