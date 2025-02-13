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
    font-awesome
    font-awesome_5
    font-awesome_4
  ];
}
