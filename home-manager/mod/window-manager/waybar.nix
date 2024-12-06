{lib, pkgs,...}:
{
  # https://github.com/rafaelrc7/dotfiles/blob/master/users/rafael/waybar.nix
  imports = [ ../nix-colors.nix ];

  programs.waybar = {
    enable = true;
    settings = [{
      layer = "bottom";
      position = "top";
      height = 24;#25;
      spacing = 5; #10;

      modules-left   = [ "sway/workspaces" "sway/mode" "sway/scratchpad" "custom/media" "wlr/taskbar"];
      #modules-center = [ "sway/window" ];
      modules-right  = [ "idle_inhibitor"  "pulseaudio" "network" "cpu" "memory" "temperature" "backlight" "sway/language" "battery" "systemd-failed-units" "privacy" "custom/weather" "custom/notification" "tray" "clock" ];

      "sway/workspaces" = {
        all-outputs = true;
        format = "{name}{icon}";
        format-icons = {
          "urgent" = "";
          "focused" = "";
          "default" = "";
        };
      };

      /*"sway/window" = {
      icon = true;
      icon-size = 16;
      };*/

      keyboard-state = {
        numlock = true;
        capslhock = true;
        format = "{name}{icon}";
        format-icons = {
          locked = "LCK";
          unlocked = "UNL";
        };
      };

      "sway/scratchpad" = {
        format = "{icon} {count}";
        show-empty = false;
        format-icons = ["" ""];
        tooltip = true;
        tooltip-format = "{app}: {title}";
      };

      idle_inhibitor = {
        format = "{icon}";
        format-icons = {
          "activated" = "";
          "deactivated" = "";
        };
      };

      cpu = {
        format = "{icon} {usage}%";
        format-icons = ["▁" "▂" "▃" "▄" "▅" "▆" "▇" "█"];
        tooltip = false;
      };

      memory = {
        format = "  {used} GiB";
      };

      temperature = {
        critical-threshold = 80;
        format = "{icon} {temperatureC}°C";
        format-icons = ["" "" ""];
      };

      backlight = {
          # "device" = "acpi_video1";
          format = "{icon} {percent}%";
          format-icons = ["" "" "" "" "" "" "" "" ""];
        };

        battery = {
          states = {
            good = 95;
            warning = 30;
            critical = 15;
          };
          format = "{icon}  {capacity}% {power:.3}W";
          format-charging = "󰂅  {capacity}% {power:.3}W";
          format-plugged = "  {capacity}% {power:.3}W";
          format-alt = "{time} {icon} ";
          format-icons = ["" "" "" "" ""];
        };

        "sway/language" = {
          format = "{}";
          on-click = "swaymsg input type:keyboard xkb_switch_layout next";
        };

        network = {
          format-wifi = "  {signalStrength}%";
          format-ethernet = "  {ifname}";
          tooltip-format = "   {ifname} via {gwaddr} at {ipaddr}";
          format-linked = "   No IP";
          format-disconnected = " ⚠  Offline";
        };

        pulseaudio = {
          scroll-step = 1;
          format = "{icon}  {volume}% {format_source}";
          format-bluetooth = "{icon}  {volume}%    {format_source}";
          format-bluetooth-muted = "{icon}  󰝟    {format_source}";
          format-muted = "󰝟 {format_source}";
          format-source = "  {volume}%";
          format-source-muted = "  ";
          format-icons = {
            headphone = "";
            hands-free = "";
            headset = "";
            phone = "";
            portable = "";
            car = "";
            default = ["󰕿" "󰖀" "󰕾"];
          };
          on-click = "pavucontrol-qt";
        };

        tray = {
          # icon-size = 21;
          spacing = 10;
        };

        "wlr/taskbar" = {
          #icon-size= 20;
          on-click = "activate";
          #format = "{icon} {title:.16}";
        };

        "custom/notification"= {
          "tooltip"= false;
          "format"= "{icon}";
          "format-icons"= {
            "notification"= "*";
            "none"= " ";
            "dnd-notification"= "*";
            "dnd-none"= "";
            "inhibited-notification"= "*";
            "inhibited-none"= "";
            "dnd-inhibited-notification"= "*";
            "dnd-inhibited-none"= "";
          };
          "return-type"= "json";
          "exec-if"= "which swaync-client";
          "exec"= "${pkgs.swaynotificationcenter}/bin/swaync-client -swb";
          "on-click"= "${pkgs.swaynotificationcenter}/bin/swaync-client -t -sw";
          "on-click-right"= "${pkgs.swaynotificationcenter}/bin/swaync-client -d -sw";
          "escape"= true;
        };

        "custom/weather" = {
          format = "{}°C";
          tooltip=  true;
          interval= 3600;
          exec= "wttrbar --lang pt --location ponta-grossa";
          return-type= "json";
        };

        clock = {
          timezone = lib.mkDefault "America/Sao_Paulo";
          tooltip-format = "<big>{:%Y %B}</big>\n<tt><small>{calendar}</small></tt>";
          format = "{:%T %d/%m/%Y}";
          interval = 1;
        };
      }
    ];

    style = ''
      * {
      font-family: Fira Sans;
      font-size: 18px;
      border-radius: 0;
      transition-duration: 0;
      }

      window#waybar { 
      background: 0; /*rgba(50,48,47,0.9);*/
      color: #FBF1C7;
      border-radius: 0px;
      }

      window#waybar.hidden {
      opacity: 0.2;
      }

      window#waybar.termite {
      background-color: #3F3F3F;
      }

      window#waybar.chromium {
      background-color: #000000;
      border: none;
      }

    #taskbar button {
      padding-top: 0;
      padding-bottom: 0;
      background: #504945;
      }

      #taskbar button.hover,
      #taskbar button.active {
       background: #32302F; 
      }

      button {
      box-shadow: inset 0 -3px transparent;
      border: none;
      border-radius: 0;
      min-height: 24px;
      min-width: 16px;
      }

      /* https://github.com/Alexays/Waybar/wiki/FAQ#the-workspace-buttons-have-a-strange-hover-effect */
      button:hover {
      background: inherit;
      /*box-shadow: inset 0 -3px #ffffff;*/
      }

      #workspaces button {
        padding: 0 5px;
        background-color: transparent;
        color: #A89984;
        border-radius: 0%;
        transition-duration: .2s;
        background: #504945;
      }

      #workspaces button:hover,
      #workspaces button.focused {
        background: #32302F;
        color: #FBF1C7;
      }

      #workspaces button.urgent {
        color: #CC241D;
      }

      #mode {
        background-color: #64727D;
        border-bottom: 3px solid #ffffff;
      }

      /*#window,
      #workspaces {
        margin: 0 4px;
      }*/

      #waybar.empty #window {
        border: none;
        background: none;
      }

      .modules-right > widget {
        background: #504945;
      }

      #battery.charging, #battery.plugged {
        background-color: #98971A;
      }

      #temperature.critical,
      #wireplumber.muted,
      #battery.critical:not(.charging),
      #network.disconnected,
      #pulseaudio.muted {
        background-color: #98971A;
      }

      #tray > .passive {
        -gtk-icon-effect: dim;
      }

      #tray > .needs-attention {
        -gtk-icon-effect: highlight;
        background-color: #eb4d4b;
      }
    '';
  };
}
