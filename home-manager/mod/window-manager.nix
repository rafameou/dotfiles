{ pkgs, ... }:
{
  imports = [
    ./window-manager/theme.nix
    ./window-manager/i3status.nix
    ./window-manager/sway.nix
    ./window-manager/i3.nix
  ];

  home.packages = with pkgs; [
    networkmanagerapplet
    killall

    gammastep

    gnome.dconf-editor

    kdePackages.ark
    kdePackages.konsole
    kdePackages.kpat
    kdePackages.kmines
    kdePackages.kcalc
    kdePackages.kalk
    kdePackages.discover
    kdePackages.kdeconnect-kde
 
    #lxqt.pcmanfm-qt
    lxqt.pavucontrol-qt
    lxqt.qps

    pkgs.nixpkgs-stable.j4-dmenu-desktop
    bemenu

    nvidia-system-monitor-qt

    selectdefaultapplication

    /*udiskie*/
    android-file-transfer

    /*for steam session*/
    openbox
  ];

  /*  programs.bash = {
  enable = true;
  profileExtra = ''*/
  programs.zsh = {
    loginExtra = ''
      export PATH="$HOME/.local/bin:$PATH" ;
    '';
  };

  home.file = {
    ".local/bin/prime-run" = {
      text = ''
        export __NV_PRIME_RENDER_OFFLOAD=1
        export __NV_PRIME_RENDER_OFFLOAD_PROVIDER=NVIDIA-G0
        export __GLX_VENDOR_LIBRARY_NAME=nvidia
        export __VK_LAYER_NV_optimus=NVIDIA_only
        exec "$@"
      '';
      executable = true;
    };
    ".local/bin/res_fix" = {
      text = ''
        #!/bin/sh
        swaymsg output eDP-1 disable
        swaymsg output HDMI-A-1 mode 1920x1080@60.000Hz
        xrandr --output eDP-1 --off
        xrandr --output HDMI-1 --mode 1920x1080
      '';
      executable = true;
    };
    ".local/bin/res_unfix" = {
      text = ''
        #!/bin/sh
        swaymsg output eDP-1 enable
        xrandr --output eDP-1 --auto
        xrandr --output HDMI-1 --auto
      '';
      executable = true;
    };
    ".local/bin/s" = {
      text = ''
        #!/bin/sh
        if [ -z "$1" ];
        then
          # https://www.reddit.com/r/swaywm/comments/11d89w2/some_workarounds_to_use_sway_with_nvidia/
          # export WLR_RENDERER=vulkan ;
          # export WLR_NO_HARDWARE_CURSORS=1 ; # breaks steam
          # export XWAYLAND_NO_GLAMOR=1 ;
          export SDL_VIDEODRIVER=wayland ;
          export QT_QPA_PLATFORM=wayland ;
          export QT_QPA_PLATFORMTHEME=qt5ct ; 
          export QT_WAYLAND_DISABLE_WINDOWDECORATION="1" ;
          export _JAVA_AWT_WM_NONREPARENTING=1 ;
          export MOZ_ENABLE_WAYLAND=1 ;
          export CLUTTER_BACKEND="wayland" ; 
          export XDG_SESSION_TYPE="wayland" ;
          exec sway --unsupported-gpu ;
        else
          startx ~/.xinitrc $1
        fi
        '';
        executable = true;
    };
    /* https://wiki.archlinux.org/title/Xinit#Switching_between_desktop_environments/window_managers */
    ".xinitrc" = {
      text = ''
        # https://www.reddit.com/r/swaywm/comments/11d89w2/some_workarounds_to_use_sway_with_nvidia/
        # unset WLR_RENDERER ;
        # unset WLR_NO_HARDWARE_CURSORS ; # breaks steam
        # unset XWAYLAND_NO_GLAMOR ;
        unset SDL_VIDEODRIVER ;
        unset QT_QPA_PLATFORM ;
        export QT_QPA_PLATFORMTHEME=qt5ct ; 
        unset QT_WAYLAND_DISABLE_WINDOWDECORATION ;
        unset _JAVA_AWT_WM_NONREPARENTING ;
        unset MOZ_ENABLE_WAYLAND ;
        unset CLUTTER_BACKEND ; 
        unset XDG_SESSION_TYPE ;

        session=${"$"}{1:-i3}
        case $session in
          i3                ) i3;; 
          steam             ) openbox & steam -bigpicture;;
          *                 ) $1;;
        esac
      '';
    };
  };

  /*services.udisks2.enable = true; services.playerctld.enable = true;*/
}
