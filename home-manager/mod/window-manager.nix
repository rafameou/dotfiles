{ pkgs, lib, ... }:
{
  imports = [
    ./window-manager/theme.nix
    ./window-manager/i3status.nix
    ./window-manager/sway.nix
    ./window-manager/hyprland.nix
    ./window-manager/waybar.nix
    #./window-manager/i3.nix
  ];

  home.packages = with pkgs; [
    networkmanagerapplet
    killall
    gammastep
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
    #udiskie
    wttrbar
    cliphist
    wl-clipboard
    grim
    slurp
    wf-recorder
    #dunst
    wayland-pipewire-idle-inhibit
    blueman
    swaynotificationcenter
    mate.mate-polkit
    brightnessctl
    playerctl
  ];

  systemd.user.services = {
    wayland-idle-pipewire-inhibit-serv = {
      Unit = {
        Wants = "graphical-session.target";
        After = "graphical-session.target";
      };

      Service = {
        Type = "simple";
        ExecStart = "${pkgs.wayland-pipewire-idle-inhibit}/bin/wayland-pipewire-idle-inhibit -d 5";
        Restart = "on-failure";
        RestartSec = 30;
      };

      Install = {
        WantedBy = [ "graphical-session.target" ];
      };
    };
  };

  services = {
    swayidle = {
      enable = true;
      systemdTarget = "sway-session.target";
      timeouts = [
        { timeout = 300; command = "${pkgs.swaylock}/bin/swaylock -Ffk -c 000000"; }
        { timeout = 600; command = "${pkgs.sway}/bin/swaymsg \"output * power off\"";
        resumeCommand = "${pkgs.sway}/bin/swaymsg \"output * power on\""; }
      ];
      events = [
        { event = "before-sleep"; command = "${pkgs.swaylock}/bin/swaylock -Ffk -c 000000"; }
      ];
    };
  };
  
  services.hypridle = {
    enable = true;
    settings = {
      general = {
        after_sleep_cmd = "hyprctl dispatch dpms on";
        ignore_dbus_inhibit = false;
        #lock_cmd = "${pkgs.hyprlock}/bin/hyprlock --immediate";
        lock_cmd = "${pkgs.swaylock}/bin/swaylock -Ffk -c 000000";
        ignore_systemd_inhibit = false;
      };

      listener = [
        {
          timeout = 300;
          on-timeout = "${pkgs.hyprlock}/bin/hyprlock";
        }
        {
          timeout = 600;
          on-timeout = "hyprctl dispatch dpms off";
          on-resume = "hyprctl dispatch dpms on";
        }
      ];
    };
  };
  systemd.user.services.hypridle.Install.WantedBy = lib.mkForce [ "hyprland-session.target" ];
  
  # programs.hyprlock = {
  #   enable = true;
  #   settings = {
  #     general = {
  #       disable_loading_bar = true;
  #       hide_cursor = true;
  #       grace = 60;
  #       no_fade_in = false;
  #       no_fade_out = false;
  #       text_trim = true;
  #     };
  #
  #     background = [
  #       {
  #         path = "screenshot";
  #         blur_passes = 3;
  #         blur_size = 8;
  #       }
  #     ];
  #
  #     input-field = [
  #       {
  #         size = "200, 50";
  #         position = "0, -80";
  #         monitor = "";
  #         dots_center = true;
  #         fade_on_empty = false;
  #         outline_thickness = 5;
  #         placeholder_text = ''<span foreground="##cad3f5">Password...</span>'';
  #         shadow_passes = 2;
  #       }
  #     ];
  #   };
  # };

}
