{ pkgs, ... }:
{
  #Enable KDE
  #services.xserver.displayManager.startx.enable = true;
  services.xserver.displayManager.sddm.enable = true;
  services.xserver.desktopManager.plasma6.enable = true;
  #services.xserver.desktopManager.lxqt.enable = true;
  #services.xserver.displayManager.defaultSession = "plasmawayland";
  
  #Enable Keyring for stuff like github-desktop
  services.gnome.gnome-keyring.enable = true;

  environment.systemPackages = with pkgs; [
    /* -- gnome apps compatibility -- */
    gnome.seahorse

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

  # flatpak
  xdg.portal = {
    enable = true;
    extraPortals = [ pkgs.xdg-desktop-portal-gtk ];
    config.common.default = "*";
  };
}
