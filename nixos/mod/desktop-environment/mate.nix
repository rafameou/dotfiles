{ pkgs, ... }:
{
  services.xserver.displayManager.lightdm.enable = false;
  services.xserver.desktopManager.mate.enable = true;
  services.xserver.desktopManager.mate.enableWaylandSession = true;

  environment.systemPackages = with pkgs; [
    mate.caja-extensions
  ];
 
  #services.gnome.gnome-keyring.enable = true;
  #security.pam.services.rafameou.kwallet.enable = true;

  # flatpak
  /*xdg.portal = {
    enable = true;
    extraPortals = [ pkgs.xdg-desktop-portal-gtk ];
    config.common.default = "*";
  };*/
}
