{ pkgs, ... }:
{   
  fonts.fontDir.enable = true;
  fonts.packages = with pkgs; [
    jetbrains-mono
    fira
    fira-mono
    fira-code
    nerd-fonts.fira-code 
    terminus_font
    nerd-fonts.terminess-ttf
    montserrat
    cozette
  ];
}
