{ pkgs, ... }:
{
  services.xserver.displayManager.startx.enable = true;
  services.xserver.displayManager.lightdm.enable = false;
  services.displayManager.ly.enable = true;
  #enable sway
  programs.sway = {
    enable = true;
    #package = null;
  };
  programs.hyprland.enable = true; # enable Hyprland
  services.displayManager.sessionPackages = [ pkgs.sway ];
  #Enable Keyring for stuff like github-desktop
  services.gnome.gnome-keyring.enable = true;
  #programs.seahorse.enable = true;

  # pcmanfm
  services.udisks2.enable = true;
  services.gvfs.enable = true; 

  security.polkit.enable = true;
  security.pam.services.swaylock = {};
}
