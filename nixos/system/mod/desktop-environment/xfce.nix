{ pkgs, ... }:
{
  # Enable the XFCE Desktop Environment.
  #services.xserver.displayManager.lightdm.enable = false;
  services.xserver.desktopManager.xfce.enable = true;

  #sound.enable = true;
  #nixpkgs.config.pulseaudio = true;
  #hardware.pulseaudio.enable = true;

  #services.gnome.gnome-keyring.enable = true;

  environment.systemPackages = with pkgs; [
    #pulseaudio
    #pavucontrol

    #gnome.seahorse

    xfce.xfce4-eyes-plugin
    xfce.xfce4-notes-plugin
    xfce.xfce4-sensors-plugin
    xfce.xfce4-pulseaudio-plugin
  ];
}
