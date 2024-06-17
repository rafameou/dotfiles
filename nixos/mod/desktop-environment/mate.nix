{ pkgs, ... }:
{
  services.xserver.displayManager.lightdm.enable = true;
  services.xserver.desktopManager.mate.enable = true;
  services.xserver.desktopManager.mate.enableWaylandSession = true;

  services.gnome.games.enable = true;
  services.gnome.gnome-keyring.enable = true;
  programs.seahorse.enable = true;

  services.ayatana-indicators = {
    enable = true;
    packages = with pkgs; [
      #ayatana-ido
      ayatana-indicator-datetime
      ayatana-indicator-display
      ayatana-indicator-messages
      ayatana-indicator-power
      ayatana-indicator-session
      ayatana-indicator-sound
      #ayatana-webmail
    ];
  };

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
}
