{ pkgs, ... }:
{
  services.xserver.displayManager.gdm.enable = true;
  services.xserver.desktopManager.gnome.enable = true;
  #services.xserver.desktopManager.gnome.flashback.enableMetacity = true;
  services.gnome.games.enable = true;

  services.gnome.gnome-keyring.enable = true;
  services.gnome.gnome-online-accounts.enable = true;

  #services.gnome.gnome-remote-desktop.enable = true;

  /*services.xrdp.enable = true;
  services.xrdp.defaultWindowManager = "gnome-remote-desktop";
  services.xrdp.openFirewall = true;*/
}
