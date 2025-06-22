{ config, pkgs, ... }:
{

  home.packages = with pkgs; [
    (colloid-icon-theme.override {
      schemeVariants = [ "gruvbox" ];
      colorVariants = [ "default" ];
    })

    (callPackage ./kde/crystal-dock.nix { })
  ];

  home.pointerCursor = {
    name = "Hackneyed";
    package = pkgs.hackneyed;
    size = 36;
    x11.enable = true;
    gtk.enable = true;
    sway.enable = true;
  };

  /*
    xdg.configFile."lxqt/wayland/lxqt-sway.config".text = ''
      include ~/.config/sway/*
      '';
  */
  xdg.configFile."lxqt/wayland/lxqt-sway.config".source = config.xdg.configFile."sway/config".source;

  # If you get an error in this line, comment it, niri validate probably stopped something.
  #xdg.configFile."lxqt/wayland/lxqt-niri.kdl".source = config.xdg.configFile."niri/config.kdl".source;

  # This is a debug option, probably will stop working soon.
  xdg.configFile."lxqt/wayland/lxqt-niri.kdl".text = config.programs.niri.finalConfig;

  # Palette stolen from https://github.com/AzumaHazuki/lxqt-themes-gruvbox/blob/main/palettes/Gruvbox-Dark
  xdg.configFile."lxqt/lxqt.conf".text = ''
    [General]
    __userfile__=true
    icon_follow_color_scheme=true
    icon_theme=Colloid-Gruvbox-Dark
    palette_override=true
    theme=valendas
    tool_bar_icon_size=24
    tool_button_style=ToolButtonTextBesideIcon
    wallpaper_override=false

    [Palette]
    base_color=#32302f
    highlight_color=#3c3846
    highlighted_text_color=#e9b143
    link_color=#8ab4f8
    link_visited_color=#ce93d8
    text_color=#f9f5d7
    tooltip_base_color=#1d1d1d
    tooltip_text_color=#cecece
    window_color=#1d2021
    window_text_color=#f9f5d7

    [Qt]
    font="Fira Sans,11,-1,5,400,0,0,0,0,0,0,0,0,0,0,1"
    style=Oxygen
  '';

  xdg.configFile."lxqt/panel.conf".text = ''
    [General]
    __userfile__=true
    iconTheme=
    panels=@Invalid()

    [backlight]
    alignment=Right
    type=backlight

    [desktopswitch]
    alignment=Left
    type=desktopswitch

    [mainmenu]
    alignment=Left
    icon=/run/current-system/sw/share/lxqt/graphics/helix_white_shadow.png
    menu_file=/run/current-system/sw/etc/xdg/menus/lxqt-applications.menu
    ownIcon=true
    showText=true
    text=
    type=mainmenu

    [panel1]
    alignment=-1
    animation-duration=0
    background-color=@Variant(\0\0\0\x43\0\xff\xff\0\0\0\0\0\0\0\0)
    background-image=
    desktop=0
    font-color=@Variant(\0\0\0\x43\0\xff\xff\0\0\0\0\0\0\0\0)
    hidable=false
    hide-on-overlap=false
    iconSize=20
    lineCount=1
    lockPanel=false
    opacity=100
    panelSize=24
    plugins=mainmenu, desktopswitch, quicklaunch, taskbar, spacer, statusnotifier, backlight, volume, worldclock, showdesktop
    position=Top
    reserve-space=true
    screen-name=
    show-delay=0
    visible-margin=true
    width=100
    width-percent=true

    [showdesktop]
    alignment=Left
    type=showdesktop

    [spacer]
    alignment=Left
    type=spacer

    [statusnotifier]
    alignment=Left
    type=statusnotifier

    [sysstat]
    alignment=Right
    graph\updateInterval=2
    type=sysstat

    [sysstat2]
    alignment=Right
    data\source=memory
    data\type=Memory
    graph\updateInterval=2
    type=sysstat

    [taskbar]
    alignment=Left
    autoRotate=true
    buttonHeight=100
    buttonStyle=IconText
    buttonWidth=220
    closeOnMiddleClick=true
    excludedList=
    groupingEnabled=false
    iconByClass=false
    raiseOnCurrentDesktop=false
    showDesktopNum=0
    showGroupOnHover=true
    showOnlyCurrentScreenTasks=false
    showOnlyMinimizedTasks=false
    showOnlyOneDesktopTasks=false
    type=taskbar
    ungroupedNextToExisting=true
    wheelDeltaThreshold=300
    wheelEventsAction=0

    [volume]
    alignment=Right
    type=volume

    [worldclock]
    alignment=Right
    autoRotate=true
    customFormat="'<b>'HH:mm:ss'</b><br/><font size=\"-2\">'ddd, d MMM yyyy'<br/>'TT'</font>'"
    dateFormatType=short
    dateLongNames=false
    datePadDay=false
    datePosition=after
    dateShowDoW=false
    dateShowYear=false
    defaultTimeZone=
    formatType=custom-timeonly
    showDate=true
    showTimezone=false
    showTooltip=false
    showWeekNumber=true
    timeAMPM=false
    timePadHour=false
    timeShowSeconds=true
    timeZones\size=0
    timezoneFormatType=iana
    timezonePosition=below
    type=worldclock
    useAdvancedManualFormat=false
  '';
}
