{ pkgs, ... }:
{
  #services.xserver.displayManager.startx.enable = true;
  #enable sway
  programs.sway = {
    enable = true;
    #package = null;
  };
  services.displayManager.sessionPackages = [ pkgs.sway ];
  #Enable Keyring for stuff like github-desktop
  #services.gnome.gnome-keyring.enable = true;
  #programs.seahorse.enable = true;

  # pcmanfm
  #services.udisks2.enable = true;
  #services.gvfs.enable = true; 

  security.polkit.enable = true;
  security.pam.services.swaylock = {};
}
