{ pkgs, ... }:
{
  #services.xserver.displayManager.lightdm.enable = false;
  services.xserver.desktopManager.mate.enable = true;
  services.xserver.desktopManager.mate.enableWaylandSession = true;

  environment.systemPackages = with pkgs; [
    mate.caja-extensions

    /*gdk-pixbuf
    webp-pixbuf-loader
    poppler
    ffmpegthumbnailer
    freetype
    libgsf
    gnome.totem #caja
    gnome-epub-thumbnailer
    f3d*/
  ];
}
