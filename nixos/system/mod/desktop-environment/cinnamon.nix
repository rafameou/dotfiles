{ pkgs, ... }:
{
  services.xserver.displayManager.lightdm.enable = true;
  #services.xserver.displayManager.gdm.enable = true;
  services.xserver.desktopManager.cinnamon.enable = true;

  services.gnome.gnome-keyring.enable = true;

  /*
    services.xrdp.enable = true;
    services.xrdp.defaultWindowManager = "gnome-remote-desktop";
    services.xrdp.openFirewall = true;
  */
}
