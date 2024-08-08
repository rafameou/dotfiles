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
    (texlive.combine {inherit (texlive) scheme-medium abnt abntex2 collection-langportuguese dvipng latexmk todonotes;})
    cherrytree
    imagemagick
    ghostscript
    /*okular*/
    #gromit-mpx
    #speedcrunch
    #notepadqq
  ];
}
