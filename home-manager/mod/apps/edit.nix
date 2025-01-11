{ pkgs, ... }:
{
  imports = [ 
    ./separated/neovim.nix
    #./separated/vscode.nix
    ./separated/flameshot.nix
    ./separated/lf.nix
  ];
  home.packages = with pkgs; [
    gimp 
    darktable
    onlyoffice-bin 
    libreoffice-qt-fresh 
    hunspell
    hunspellDicts.pt_BR
    corefonts
    vistafonts
    feishin strawberry-qt6 
    mpv
    texlive.combined.scheme-full
    cherrytree
    imagemagick
    ghostscript
    sioyek

    #apostrophe #broken 03-11-2024, not needed
    zettlr
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
