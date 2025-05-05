{ pkgs, ... }:
{
  imports = [ 
    ./separated/emacs.nix
    ./separated/mpv.nix
    ./separated/neovim.nix
    #./separated/vscode.nix
    #./separated/flameshot.nix
    ./separated/lf.nix
  ];

  # programs.zed-editor = {
  #   enable = true;
  #   package = pkgs.zed-editor-fhs;
  # };

  programs.vscode = {
    enable = true;
    package = pkgs.vscodium-fhs;
  };

  home.packages = with pkgs; [
    gimp3 
    darktable
    onlyoffice-bin 
    libreoffice-qt-fresh 
    hunspell
    hunspellDicts.pt_BR
    corefonts
    vistafonts
    #feishin #broken 22-01-2025, electron, not needed
    strawberry-qt6 
    texlive.combined.scheme-full
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

    /*okular*/
    #gromit-mpx
    #speedcrunch
    #notepadqq
  ];
}
