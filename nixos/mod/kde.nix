{ inputs, lib, config, pkgs, ... }:
{
  #Enable KDE
  services.xserver.displayManager.sddm.enable = true;
  services.xserver.desktopManager.plasma5.enable = true;
  #services.xserver.desktopManager.lxqt.enable = true;
  services.xserver.displayManager.defaultSession = "plasmawayland";
  
  #Enable Keyring for stuff like github-desktop
  services.gnome.gnome-keyring.enable = true;

  environment.systemPackages = with pkgs; [
      gnome.seahorse
      labwc
      waybar
  ];
}
