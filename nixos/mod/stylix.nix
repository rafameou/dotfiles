{ pkgs, ... }:
{
  stylix = {
    image = "/etc/wallpaper";
    polarity = "dark";
    base16Scheme = "${pkgs.base16-schemes}/share/themes/gruvbox-dark-soft.yaml"; 
    opacity = {
      applications = 0.9;
      desktop = 0.9;
      popups = 0.9;
      terminal = 0.9;
    };

    fonts = {
      sansSerif = {
        name = "Fira Sans";
        package = pkgs.fira;
      };
      monospace = {
        name = "FiraCode Nerd Font Mono";
        package = pkgs.fira-code-nerdfont;
      };
    };

    cursor = {
      name = "Adwaita";
      size = 24;
      package = pkgs.gnome.adwaita-icon-theme;
    };
  };
}
