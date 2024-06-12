{ pkgs, ... }:
{
  stylix = {
    enable = true;
    #image = "/etc/wallpaper";
    image = pkgs.fetchurl {
      url = "https://w.wallhaven.cc/full/wy/wallhaven-wyv7jq.jpg";
      sha256 = "926a11ba3e0d61d63141b9f5959d7d98546f7cb8634cf6c6a7bfb3c4185cb7a3";
    };
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
