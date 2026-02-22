{ pkgs, ... }:
{
  home.packages = with pkgs; [
    arc-theme
    arc-icon-theme
    colloid-gtk-theme
    colloid-icon-theme
    mint-themes
    mint-y-icons
    mint-x-icons
    mint-cursor-themes
    zuki-themes
    greybird
    theme-obsidian2
    iconpack-obsidian
    elementary-xfce-icon-theme

    swww
    crystal-dock
  ];

  qt = {
    enable = true;
    platformTheme.name = "gtk";
  };

  #services.gammastep.enable = true;
  #services.redshift.provider = "geoclue2";

  xfconf.settings = {
    xfce4-session = {
      "general/LockCommand" = "swaylock -Ffk -c 000000";
    };
    xfce4-panel = {
      "/force-all-internal" = true;
    };
  };

  xdg.configFile = {
    "crystal-dock/XFCE/panel_1.conf".text = ''
      [General]
      autoHide=false
      launchers="vivaldi-stable;org.telegram.desktop;vesktop;signal;element-desktop;xfce4-terminal;bitwarden;thunar;onlyoffice-desktopeditors;startcenter;codium;mousepad;gimp;org.kde.krita;org.kde.kpat;steam;smartcode-stremio;xsane;virt-manager;protonvpn-app;xftask"
      position=1
      screen=0
      showApplicationMenu=false
      showBatteryIndicator=false
      showClock=false
      showKeyboardLayout=false
      showPager=false
      showTaskManager=true
      showTrash=true
      showVersionChecker=false
      showVolumeControl=false
      showWifiManager=false
      visibility=3
    '';
    "crystal-dock/XFCE/appearance.conf".text = ''
      [General]
      activeIndicatorColor=#ff8c00
      backgroundColor=#1D2021
      borderColor=#D65D0E
      firstRunWindowCountIndicator=false
      floatingMargin=2
      inactiveIndicatorColor=#008b8b
      maximumIconSize=48
      minimumIconSize=48
      panelStyle=0
      showBorder=true
      spacingFactor=0.4
      tooltipFontSize=12

      [Application%20Menu]
      backgroundAlpha=0.8
      fontSize=14
      label=Applications

      [Clock]
      fontScaleFactor=1
      use24HourClock=true

      [TaskManager]
      currentDesktopTasksOnly=false
    '';
  };
}
