{ pkgs, ... }:
{
  services.xserver.displayManager.lightdm.enable = true;
  services.xserver.desktopManager.cinnamon.enable = true;

  services.gnome.gnome-keyring.enable = true;

  /*services.xrdp.enable = true;
  services.xrdp.defaultWindowManager = "gnome-remote-desktop";
  services.xrdp.openFirewall = true;*/

  # flatpak
  xdg.portal = {
    enable = true;
    #extraPortals = [ pkgs.xdg-desktop-portal-gtk ];
    config.common.default = "*";
  };

  # thumbnails
  #services.tumbler.enable = true;
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
}