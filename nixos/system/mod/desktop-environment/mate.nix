{ pkgs, ... }:
{
  services.xserver.displayManager.lightdm.enable = true;
  services.xserver.desktopManager.mate.enable = true;
  #services.xserver.desktopManager.mate.enableWaylandSession = true;

  services.gnome.games.enable = true;
  services.gnome.gnome-keyring.enable = true;
  programs.seahorse.enable = true;

  programs.evolution.enable = true;
  services.gnome.evolution-data-server.enable = true;

  qt = {
    enable = true;
    platformTheme = "gtk2";
  };

  services.ayatana-indicators = {
    enable = true;
    packages = with pkgs; [
      #ayatana-ido
      ayatana-indicator-datetime
      ayatana-indicator-display
      ayatana-indicator-messages
      ayatana-indicator-power
      ayatana-indicator-session
      ayatana-indicator-sound
      #ayatana-webmail
    ];
  };

  environment.systemPackages = with pkgs; [
    mate.caja-extensions
  ];
}
