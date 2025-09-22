{ pkgs, ... }:
{
  imports = [
    ./separated/emacs.nix
    ./separated/mpv.nix
    ./separated/neovim.nix
    ./separated/vscodium.nix
    #./separated/flameshot.nix
    ./separated/lf.nix
  ];

  # programs.zed-editor = {
  #   enable = true;
  #   package = pkgs.zed-editor-fhs;
  # };

  nixpkgs.config.permittedInsecurePackages = [
    "libxml2-2.13.8" # packettracer
  ];

  home.packages = with pkgs; [
    nixfmt-rfc-style
    gimp3
    darktable
    onlyoffice-bin
    libreoffice-qt-fresh
    hunspell
    hunspellDicts.pt_BR
    corefonts
    vistafonts
    #feishin #broken 22-01-2025, electron, not needed
    strawberry # broken 18-07-2025
    #texlive.combined.scheme-full
    cherrytree
    imagemagick
    ghostscript
    sioyek

    #apostrophe #broken 03-11-2024, not needed
    # zettlr
    kdePackages.ghostwriter
    kdePackages.kmplot

    kdePackages.kdenlive
    krita
    kdePackages.kolourpaint

    ciscoPacketTracer8
    godot

    # okular
    #gromit-mpx
    #speedcrunch
    #notepadqq
  ];
}
