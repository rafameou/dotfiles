{ pkgs, ... }:
{
  imports = [ 
    ./separated/neovim.nix
    #./separated/vscode.nix
  ];
  home.packages = with pkgs; [
    gimp
    onlyoffice-bin 
    libreoffice-qt6-fresh 
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

    apostrophe
    zettlr


    kdePackages.kdenlive
    krita
    kdePackages.kolourpaint

    /*okular*/
    #gromit-mpx
    #speedcrunch
    #notepadqq
  ];
}
