{ inputs, lib, config, pkgs, ... }:
{
  home.packages = with pkgs; [
    gimp
    onlyoffice-bin
    libreoffice
    hunspell
    hunspellDicts.pt_BR
    strawberry
    celluloid #mpv
    (texlive.combine {inherit (texlive) scheme-small abnt abntex2 collection-langportuguese dvipng;})
    cherrytree
    texstudio
    gnome-latex
  ];
}