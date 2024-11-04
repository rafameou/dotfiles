{ pkgs, ... }:
{
  imports = [
    ./window-manager/theme.nix
    ./window-manager/i3status.nix
    ./window-manager/sway.nix
    #./window-manager/i3.nix
  ];

  home.packages = with pkgs; [
    networkmanagerapplet
    killall

    gammastep

    #gnome.dconf-editor

    kdePackages.ark
    kdePackages.kalk
    kdePackages.kdeconnect-kde
 
    lxqt.pcmanfm-qt
    lxqt.pavucontrol-qt
    lxqt.qps

    #j4-dmenu-desktop
    #bemenu

    #nvidia-system-monitor-qt

    #selectdefaultapplication

    /*udiskie*/
    wttrbar
  ];
}
