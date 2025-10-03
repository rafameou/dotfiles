{
  lib,
  config,
  inputs,
  pkgs,
  ...
}:
{
  wayland.windowManager.labwc = {
    enable = true;
    xwayland.enable = true;
    environment = [
      "XKB_DEFAULT_LAYOUT=br(abnt2)"
      "XKB_DEFAULT_MODEL=pc104"
      "XCURSOR_THEME=Adwaita"
      "NIXOS_OZONE_WL=1"
      "ELECTRON_OZONE_PLATFORM_HINT=wayland"
      "_JAVA_AWT_WM_NONREPARENTING=1"
      "QT_QPA_PLATFORMTHEME=qt6ct"
    ];
    rc = {
      core = {
        adaptiveSync = "yes";
        decoration = "server";
      };
      theme = {
        name = "GTK";
        cornerRadius = 0;
        font = {
          "@name" = "Fira Sans";
          "@size" = "11";
        };
      };
      desktops = {
        "@number" = 1;
      };
      snapping = {
        "@range" = 10;
      };
      keyboard = {
        default = true;
        keybind = [
          {
            "@key" = "W-t";
            action = {
              "@name" = "Execute";
              "@command" = "foot";
            };
          }
          {
            "@key" = "W-d";
            action = {
              "@name" = "Execute";
              "@command" = "fuzzel";
            };
          }
          {
            "@key" = "W-F4";
            action = {
              "@name" = "None";
            };
          }
          {
            "@key" = "W-l";
            action = {
              "@name" = "Execute";
              "@command" = "swaylock -Ffk -c 000000";
            };
          }
          {
            "@key" = "S-Print";
            action = {
              "@name" = "Execute";
              "@command" = "xfce4-screenshooter -f -m";
            };
          }
          {
            "@key" = "Print";
            action = {
              "@name" = "Execute";
              "@command" = "flameshot gui";
            };
          }
          {
            "@key" = "XF86AudioPlay";
            action = {
              "@name" = "Execute";
              "@command" = "playerctl play-pause";
            };
          }
          {
            "@key" = "XF86AudioStop";
            action = {
              "@name" = "Execute";
              "@command" = "playerctl stop";
            };
          }
          {
            "@key" = "XF86AudioPrev";
            action = {
              "@name" = "Execute";
              "@command" = "playerctl previous";
            };
          }
          {
            "@key" = "XF86AudioNext";
            action = {
              "@name" = "Execute";
              "@command" = "playerctl next";
            };
          }
          {
            "@key" = "Shift+XF86AudioPrev";
            action = {
              "@name" = "Execute";
              "@command" = "playerctl position 10-";
            };
          }
          {
            "@key" = "Shift+XF86AudioNext";
            action = {
              "@name" = "Execute";
              "@command" = "playerctl position 10+";
            };
          }
          {
            "@key" = "Shift+XF86AudioLowerVolume";
            action = {
              "@name" = "Execute";
              "@command" = "playerctl volume 0.1-";
            };
          }
          {
            "@key" = "Shift+XF86AudioRaiseVolume";
            action = {
              "@name" = "Execute";
              "@command" = "playerctl volume 0.1+";
            };
          }
          {
            "@key" = "XF86AudioMute";
            action = {
              "@name" = "Execute";
              "@command" = "wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle";
            };
          }
          {
            "@key" = "XF86AudioLowerVolume";
            action = {
              "@name" = "Execute";
              "@command" = "wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-";
            };
          }
          {
            "@key" = "XF86AudioRaiseVolume";
            action = {
              "@name" = "Execute";
              "@command" = "wpctl set-volume -l 1.5 @DEFAULT_AUDIO_SINK@ 5%+";
            };
          }
          {
            "@key" = "XF86AudioMicMute";
            action = {
              "@name" = "Execute";
              "@command" = "wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle";
            };
          }
          {
            "@key" = "XF86MonBrightnessUp";
            action = {
              "@name" = "Execute";
              "@command" = "brightnessctl set 10%+";
            };
          }
          {
            "@key" = "XF86MonBrightnessDown";
            action = {
              "@name" = "Execute";
              "@command" = "brightnessctl set 10%-";
            };
          }
          {
            "@key" = "W-S-q";
            action = {
              "@name" = "Close";
            };
          }
          {
            "@key" = "A-Tab";
            action = {
              "@name" = "NextWindow";
            };
          }
          {
            "@key" = "W-Tab";
            action = {
              "@name" = "ToggleMaximize";
            };
          }
          {
            "@key" = "W-1";
            action = {
              "@name" = "GoToDesktop";
              "@to" = "1";
            };
          }
          {
            "@key" = "W-2";
            action = {
              "@name" = "GoToDesktop";
              "@to" = "2";
            };
          }
          {
            "@key" = "W-3";
            action = {
              "@name" = "GoToDesktop";
              "@to" = "3";
            };
          }
          {
            "@key" = "W-4";
            action = {
              "@name" = "GoToDesktop";
              "@to" = "4";
            };
          }
          {
            "@key" = "W-S-equal";
            action = {
              "@name" = "ZoomIn";
            };
          }
          {
            "@key" = "W-S-minus";
            action = {
              "@name" = "ZoomOut";
            };
          }
        ];
      };
    };
  };
  xdg.configFile."xfce4/labwc/rc.xml".source = config.xdg.configFile."labwc/rc.xml".source;
  xdg.configFile."xfce4/labwc/environment".source = config.xdg.configFile."labwc/environment".source;

}
