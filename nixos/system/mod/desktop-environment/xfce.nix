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

    xfce4-eyes-plugin
    xfce4-notes-plugin
    xfce4-sensors-plugin
    xfce4-pulseaudio-plugin
    xfce4-weather-plugin
    xfce4-systemload-plugin
    xfce4-cpugraph-plugin
    xfce4-whiskermenu-plugin
    xfce4-windowck-plugin
    xfce4-fsguard-plugin
  ];
}
