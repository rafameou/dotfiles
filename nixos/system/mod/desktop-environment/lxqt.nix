{ pkgs, ... }:
{
  # Enable the LXQT Desktop Environment.
  # services.displayManager.sddm.enable = true;
  services.xserver.desktopManager.lxqt.enable = true;
  xdg.portal.lxqt.enable = true;

  programs.labwc.enable = true;
  environment.systemPackages = with pkgs; [
    labwc-tweaks
  ];
}
