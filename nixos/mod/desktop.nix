{ pkgs, ... }:
{
  # Enable the X11 windowing system.
  services.xserver.enable = true;

  # Configure keymap in X11
  services.xserver.xkb = {
    layout = "br";
    #xkbVariant = "";
  };

  #dconf
  programs.dconf.enable = true;

  #services.onedrive.enable = true;

  #fonts, move to home maybe
  fonts.fontDir.enable = true;
  fonts.packages = with pkgs; [
    jetbrains-mono
    fira
    fira-mono
    fira-code
    fira-code-nerdfont
    terminus_font
    terminus-nerdfont
    montserrat
    cozette
  ];

  hardware.graphics = { # this fixes the "glXChooseVisual failed" bug, context: https://github.com/NixOS/nixpkgs/issues/47932 
    enable = true;  
    enable32Bit = true; 
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

  services.fwupd.enable = true;

  # Enable touchpad support (enabled default in most desktopManager).
  # services.xserver.libinput.enable = true;
}
