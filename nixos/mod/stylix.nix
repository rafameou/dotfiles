{ pkgs, ... }:
{
  stylix = {
    enable = true;
    #image = "/etc/wallpaper";
    image = pkgs.fetchurl {
      url = "https://w.wallhaven.cc/full/g7/wallhaven-g7781d.jpg";
      sha256 = "47113ceb5984c23d477d9f3cbf548c19abfa380844226414d05bcb4ebc8a428a";
    };

    targets = {
      chromium.enable = false;
      grub.enable = false;
      gtk.enable = false;
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
      name = "Oxygen_Zion";
      size = 24;
      package = pkgs.kdePackages.oxygen;
    };
  };
}
