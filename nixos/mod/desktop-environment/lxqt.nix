{ pkgs, ... }:
{
  # Enable the LXQT Desktop Environment.
  services.xserver.displayManager.sddm.enable = true;
  services.xserver.desktopManager.lxqt.enable = true;
  xdg.portal.lxqt.enable = true;
  /*environment.systemPackages = with pkgs; [

  ];*/
}
