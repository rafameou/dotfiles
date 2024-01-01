{configs, pkgs, lib, ...}:
{
  imports = [
    ./theme.nix
    ./sway.nix
    ./i3.nix
  ];

  home.packages = with pkgs; [
    networkmanagerapplet
    killall

    ark 
    imv
    lxqt.pcmanfm-qt
    lxqt.pavucontrol-qt
    lxqt.qps

    selectdefaultapplication

    udiskie
    android-file-transfer
  ];

  /*  programs.bash = {
  enable = true;
  profileExtra = ''*/
  programs.zsh = {
    loginExtra = ''
      export PATH="$HOME/.local/bin:$PATH" ;
      if [ "$(tty)" = "/dev/tty1" ]; then
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
      fi
      if [ "$(tty)" = "/dev/tty2" ]; then
        startx ;
      fi
    '';
  };

  services.dunst = {
    enable = true;
  };

  /*services.udisks2.enable = true; services.playerctld.enable = true;*/
 }
