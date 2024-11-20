{lib, pkgs,...}:
{
  # https://github.com/rafaelrc7/dotfiles/blob/master/users/rafael/waybar.nix
  imports = [ ../nix-colors.nix ];

  programs.waybar = {
    enable = true;
    settings = [{
      layer = "bottom";
      position = "top";
      height = 30;#25;
      spacing = 5;

      modules-left   = [ "sway/workspaces" "sway/mode" "sway/scratchpad" "custom/media" "sway/window"];
      #modules-center = [ "sway/window" ];
      modules-right  = [ "tray" "idle_inhibitor" "custom/weather" "pulseaudio" "network" "cpu" "memory" "temperature" "backlight" "keyboard-state" "sway/language" "battery" "battery#bat2" "clock" "custom/notification" ];

      "sway/workspaces" = {
        all-outputs = true;
        format = "{name}{icon}";
        format-icons = {
          "urgent" = " ";
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
          locked = "";
          unlocked = "";
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

      tray = {
          # icon-size = 21;
          spacing = 10;
        };

        "custom/weather" = {
          format = "{}°";
          tooltip=  true;
          interval= 3600;
          exec= "wttrbar --location ponta-grossa";
          return-type= "json";
        };

        clock = {
          timezone = lib.mkDefault "America/Sao_Paulo";
          tooltip-format = "<big>{:%Y %B}</big>\n<tt><small>{calendar}</small></tt>";
          format = "{:%T %d/%m/%Y}";
          interval = 1;
        };

        cpu = {
          format = "{usage}% ";
          tooltip = false;
        };

        memory = {
          format = "{}% ";
        };

        temperature = {
          # "thermal-zone" = 2;
          # "hwmon-path" = "/sys/class/hwmon/hwmon2/temp1_input";
          critical-threshold = 80;
          # "format-critical" = "{temperatureC}°C {icon}";
          format = "{temperatureC}°C {icon}";
          format-icons = ["" "" ""];
        };

        backlight = {
          # "device" = "acpi_video1";
          format = "{percent}% {icon}";
          format-icons = ["" "" "" "" "" "" "" "" ""];
        };

        battery = {
          states = {
            good = 95;
            warning = 30;
            critical = 15;
          };
          format = "{capacity}% {icon} ";
          format-charging = "{capacity}% 󰂅";
          format-plugged = "{capacity}%  ";
          format-alt = "{time} {icon} ";
          format-icons = ["" "" "" "" ""];
        };

        "battery#bat2" = {
          bat = "BAT2";
        };

        "sway/language" = {
          format = "{variant}{flag}";
          on-click = "swaymsg input type:keyboard xkb_switch_layout next";
        };

        network = {
          format-wifi = "{essid} ({signalStrength}%) ";
          format-ethernet = "";
          tooltip-format = "{ifname} via {gwaddr} at {ipaddr} ";
          format-linked = "{ifname} (No IP) ";
          format-disconnected = "Disconnected ⚠";
        };

        pulseaudio = {
          scroll-step = 1;
          format = "{volume}% {icon}  {format_source}";
          format-bluetooth = "{volume}% {icon}  {format_source}";
          format-bluetooth-muted = " {icon}  {format_source}";
          format-muted = "   {format_source}";
          format-source = "{volume}% ";
          format-source-muted = "";
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

      "custom/notification"= {
        "tooltip"= false;
        "format"= "{icon}";
        "format-icons"= {
          "notification"= "<span foreground='red'><sup></sup></span>";
          "none"= "";
          "dnd-notification"= "<span foreground='red'><sup></sup></span>";
          "dnd-none"= "";
          "inhibited-notification"= "<span foreground='red'><sup></sup></span>";
          "inhibited-none"= "";
          "dnd-inhibited-notification"= "<span foreground='red'><sup></sup></span>";
          "dnd-inhibited-none"= "";
        };
        "return-type"= "json";
        "exec-if"= "which swaync-client";
        "exec"= "${pkgs.swaynotificationcenter}/bin/swaync-client -swb";
        "on-click"= "${pkgs.swaynotificationcenter}/bin/swaync-client -t -sw";
        "on-click-right"= "${pkgs.swaynotificationcenter}/bin/swaync-client -d -sw";
        "escape"= true;
      };
    }];

    style = ''
    * {
      font-family: Fira Sans;
      font-size: 16px;
      border-radius: 5px;
    }

    window#waybar { 
      background: linear-gradient(180deg, rgba(50,48,47,0.9) 0%, rgba(29, 32, 33,1) 100%);
      color: #ffffff;
      transition-property: background-color;
      transition-duration: .5s;
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
        color: #ffffff;
        border-radius: 0%;
        transition-duration: .2s;
      }

      #workspaces button:hover {
        background: radial-gradient(circle, rgba(150,150,150,1) 0%, rgba(0,0,0,0) 100%);
      }

      #workspaces button.focused {
        background: radial-gradient(circle, rgba(255,255,255,1) 0%, rgba(0,0,0,0) 100%);
        color: #000000;
      }

      #workspaces button.urgent {
        background: radial-gradient(circle, rgba(231,77,75,1) 0%, rgba(0,0,0,0) 100%);

      }

      #mode {
        background-color: #64727D;
        border-bottom: 3px solid #ffffff;
      }

      #custom-notification,
      #clock,
      #battery,
      #cpu,
      #memory,
      #disk,
      #temperature,
      #backlight,
      #network,
      #pulseaudio,
      #wireplumber,
      #custom-media,
      #custom-weather,
      #tray,
      #mode,
      #idle_inhibitor,
      #scratchpad,
      #language,
      #mpd  {
        padding: 0 10px;
        color: #ffffff;
        border: 1px solid rgba(125,125,125,0.75);	
        background: radial-gradient(circle, rgba(70,70,70,0.5) 0%, rgba(0,0,0,0.5) 100%);
      }

      #window,
      #workspaces {
        margin: 0 4px;
      }

      #waybar.empty #window {
        border: none;
        background: none;
      }


      #battery.charging, #battery.plugged {
        color: #00ff00;
      }

      #temperature.critical,
      #wireplumber.muted,
      #battery.critical:not(.charging),
      #network.disconnected,
      #pulseaudio.muted {
        color: #ff0000;
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
