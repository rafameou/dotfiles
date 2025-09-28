{ pkgs, ... }:
{
  # Enable the LXQT Desktop Environment.
  #services.displayManager.sddm.enable = true;
  #services.displayManager.sddm.wayland.enable = true;
  services.xserver.desktopManager.lxqt.enable = true;
  #xdg.portal.lxqt.enable = true;

  environment.systemPackages = with pkgs; [
    # -- appmenu --
    #appmenu-gtk3-module # breaks everything
    libappindicator-gtk3

    /*
      -----------------------------------------|
      | decided to move to here, since they kinda |
      | are like system packages                  |
      |------------------------------------------
    */
    kdePackages.oxygen
    kdePackages.oxygen.qt5
    kdePackages.oxygen-sounds
    kdePackages.oxygen-icons
  ];
}
