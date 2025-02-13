{ pkgs, ... }:
{
  # thumbnails
  #services.tumbler.enable = true;
  environment.systemPackages = with pkgs; [
    gdk-pixbuf
    webp-pixbuf-loader
    poppler
    ffmpegthumbnailer
    freetype
    libgsf
    totem #caja
    gnome-epub-thumbnailer
    f3d
    poppler_utils
    atool
    colordiff
    chafa
    jq
    glow
  ];
}
