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
    (texlive.combine {inherit (texlive) scheme-small abnt abntex2 collection-langportuguese dvipng;})
    cherrytree
    kile 
    imagemagick
    ghostscript
    okular
  ];

  programs.vscode = {
  enable = true;
  extensions = with pkgs.vscode-extensions; [
    vscodevim.vim
    ms-vscode.cpptools
    ms-vscode.makefile-tools
    ms-vscode.cmake-tools
    daohong-emilio.yash
    redhat.java
    redhat.vscode-xml
    redhat.vscode-yaml
    bbenoist.nix
  ];
};
}
