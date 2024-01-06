{configs, pkgs, lib, ...}:
{
  #imports = [  ];
  home.packages = with pkgs; [
    brightnessctl
    playerctl

    i3status-rust
    i3lock
    maim
    xclip
    feh
    redshift
  ];

  xsession.windowManager.i3 = {
    enable = true;
    config = rec {
      modifier = "Mod4";
      fonts = {
        names = ["Fira Mono"];
        size = 10.0;
      };
      menu = "${pkgs.rofi}/bin/rofi -show run";
      bars = [
        {
          fonts = {
            names = ["Fira Mono"];
            size = 10.0;
          };
          position = "top";
          statusCommand = "${pkgs.i3status-rust}/bin/i3status-rs ~/.config/i3status-rust/config-top.toml";
          colors = {
            background = "#303446";
            statusline = "#c6d0f5";
            inactiveWorkspace = {
              background = "#303446";
              border = "#a6d189";  
              text = "#ffffff";
            };
            focusedWorkspace = {
              background = "#a6d189";
              border = "#a6d189";  
              text = "#303466";
            };
            urgentWorkspace = {
              background = "#e78284";
              border = "#800000";  
              text = "#ffffff";
            };
          };
        }
      ];
      terminal = "kitty";
      floating = {
        border = 1;
        titlebar = true; #doesnt work
      };
      window = {
        border = 1;
        titlebar = false;
        hideEdgeBorders = "smart";
        commands = [ ];
      };
      startup = [
        /* https://github.com/swaywm/sway/wiki#gtk-applications-take-20-seconds-to-start */
        {command = "--no-startup-id nm-applet --indicator";}
        {command = "--no-startup-id ${pkgs.feh}/bin/feh --bg-fill ~/back"; } #fill
        /*{command = "--no-startup-id ${pkgs.udiskie}/bin/udiskie -t"; }*/
        {command = "--no-startup-id ${pkgs.pcmanfm-qt}/bin/pcmanfm-qt -d"; }
        {command = "--no-startup-id ${pkgs.gammastep}/bin/gammastep -l geoclue2 -m wayland"; } 
      ];
      keybindings = lib.mkOptionDefault {
        /*"XF86AudioPlay"              = "exec ${pkgs.playerctl}/bin/playerctl play-pause";
        "XF86AudioStop"              = "exec ${pkgs.playerctl}/bin/playerctl stop";
        "XF86AudioPrev"              = "exec ${pkgs.playerctl}/bin/playerctl previous";
        "XF86AudioNext"              = "exec ${pkgs.playerctl}/bin/playerctl next";
        "shift+XF86AudioPrev"        = "exec ${pkgs.playerctl}/bin/playerctl position 10-";
        "shift+XF86AudioNext"        = "exec ${pkgs.playerctl}/bin/playerctl position 10+";
        "shift+XF86AudioLowerVolume" = "exec ${pkgs.playerctl}/bin/playerctl volume 0.1-";
        "shift+XF86AudioRaiseVolume" = "exec ${pkgs.playerctl}/bin/playerctl volume 0.1+";

        "${alt}+XF86AudioMute" = "exec ${pkgs.wireplumber}/bin/wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle";*/

        "XF86AudioMute"        = "exec ${pkgs.wireplumber}/bin/wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle";
        "XF86AudioLowerVolume" = "exec ${pkgs.wireplumber}/bin/wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-";
        "XF86AudioRaiseVolume" = "exec ${pkgs.wireplumber}/bin/wpctl set-volume -l 1.5 @DEFAULT_AUDIO_SINK@ 5%+";

        "XF86MonBrightnessUp"   = "exec ${pkgs.brightnessctl}/bin/brightnessctl set 10%+";
        "XF86MonBrightnessDown" = "exec ${pkgs.brightnessctl}/bin/brightnessctl set 10%-";

        "Print"          = "exec --no-startup-id ${pkgs.maim}/bin/maim -s | ${pkgs.xclip}/bin/xclip -selection clipboard -t image/png"; #https://superuser.com/a/1803843
        "${modifier}+l"  = "exec --no-startup-id ${pkgs.i3lock}/bin/i3lock -c 000000";
      };
    };
  };
}
