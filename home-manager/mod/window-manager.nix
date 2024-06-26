{ pkgs, ... }:
{
  imports = [
    #./window-manager/theme.nix
    ./window-manager/i3status.nix
    ./window-manager/sway.nix
    #./window-manager/i3.nix
  ];

  home.packages = with pkgs; [
    networkmanagerapplet
    killall

    gammastep

    #gnome.dconf-editor

    /*kdePackages.ark
    kdePackages.konsole
    kdePackages.kpat
    kdePackages.kmines
    kdePackages.kcalc
    kdePackages.kalk
    kdePackages.discover
    kdePackages.kdeconnect-kde*/
 
    #lxqt.pcmanfm-qt
    #lxqt.pavucontrol-qt
    #lxqt.qps

    pavucontrol

    j4-dmenu-desktop
    bemenu

    #nvidia-system-monitor-qt

    #selectdefaultapplication

    /*udiskie*/
    android-file-transfer
  ];
}
