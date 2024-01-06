{configs, pkgs, lib, ...}:
{
  imports = [
    ./theme.nix
    ./i3status.nix
    ./sway.nix
    ./i3.nix
  ];

  home.packages = with pkgs; [
    networkmanagerapplet
    killall

    gammastep

    ark 
    imv
    lxqt.pcmanfm-qt
    lxqt.pavucontrol-qt
    lxqt.qps

    selectdefaultapplication

    /*udiskie*/
    android-file-transfer
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
    ".local/bin/startsway" = {
      text = ''
        #!/bin/sh
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
      '';
      executable = true;
    };
    ".xinitrc" = {
      text = ''
        exec i3
      '';
    };
    ".local/bin/starti3" = {
      text = ''
        #!/bin/sh
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
        exec startx ;
      '';
      executable = true;
    };
  };

  services.dunst = {
    enable = true;
  };

  programs.kitty = {
    enable = true;
    theme = "Catppuccin-Frappe";
    shellIntegration.enableZshIntegration = true;
    font = {
      name = "Spleen 32x64";
      package = pkgs.spleen;
      size = 12;
    };
  };

  /*services.udisks2.enable = true; services.playerctld.enable = true;*/
}
