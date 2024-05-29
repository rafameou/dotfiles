{ config, ... }:
{
  programs.fuzzel = {
    enable = true;
    settings = {
      main = {
        icon-theme = "hicolor";
        font = "Fira Sans";
      };
      border = {
        width = 1;
        radius = 0;
      };
    };
  }; 
}
