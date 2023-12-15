{ inputs, lib, config, pkgs, ... }:
{
  home.packages = with pkgs; [
    gimp
    onlyoffice-bin
    libreoffice
    hunspell
    hunspellDicts.pt_BR
    corefonts
    vistafonts
    strawberry
    mpv
    (texlive.combine {inherit (texlive) scheme-medium abnt abntex2 collection-langportuguese dvipng latexmk todonotes;})
    cherrytree
    kile 
    imagemagick
    ghostscript
    /*okular*/
    qpdfview
    gromit-mpx
    speedcrunch
    notepadqq
  ];
}
