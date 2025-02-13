{ pkgs, ... }:
{
  #Enable KDE
  #services.xserver.displayManager.startx.enable = true;
  services.displayManager.sddm.enable = true;
  services.displayManager.sddm.wayland.enable = true;
  services.desktopManager.plasma6.enable = true;
  #services.xserver.desktopManager.lxqt.enable = true;
  #services.xserver.displayManager.defaultSession = "plasmawayland";
  
  #Enable Keyring for stuff like github-desktop
  services.gnome.gnome-keyring.enable = true;
  #programs.seahorse.enable = true;

  qt = {
    enable = true;
    platformTheme = "kde";
  };

  environment.systemPackages = with pkgs; [
    /* -- appmenu -- */
    #appmenu-gtk3-module # breaks everything
    libappindicator-gtk3

    /* -----------------------------------------|
    | decided to move to here, since they kinda |
    | are like system packages                  |
    |------------------------------------------*/
    kdePackages.oxygen
    kdePackages.oxygen.qt5 
    kdePackages.oxygen-sounds
    kdePackages.oxygen-icons
  ];
}
