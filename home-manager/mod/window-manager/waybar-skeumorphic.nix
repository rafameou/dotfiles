 {lib, ...}:
 {
  # https://github.com/rafaelrc7/dotfiles/blob/master/users/rafael/waybar.nix

  programs.waybar = {
    enable = true;
    settings = [{
      layer = "bottom";
      position = "bottom";
      height = 25;
      spacing = 5;

      modules-left   = [ "sway/workspaces" "sway/mode" "sway/scratchpad" "custom/media" "sway/window"];
      #modules-center = [ "sway/window" ];
      modules-right  = [ "tray" "idle_inhibitor" "pulseaudio" "network" "cpu" "memory" "temperature" "backlight" "keyboard-state" "sway/language" "battery" "battery#bat2" "clock" ];

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
          format = "{}% ";
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
          format-charging = "{capacity}%  ";
          format-plugged = "{capacity}%  ";
          format-alt = "{time} {icon} ";
          format-icons = ["" "" "" "" ""];
        };

        "battery#bat2" = {
          bat = "BAT2";
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
            default = ["" "" ""];
          };
          on-click = "pavucontrol-qt";
        };
      }];

      style = ''
        * {
          /* `otf-font-awesome` is required to be installed for icons */
          font-family: Inter, "Font Awesome 6 Free";
          font-size: 12px;
          border-radius: 5px;
        }

        window#waybar {
          /*background-color: rgba(43, 48, 59, 0.5);*/
          background: linear-gradient(180deg, rgba(70,70,70,0.75) 0%, rgba(0,0,0,0.75) 100%);
          /*border-bottom: 3px solid rgba(100, 114, 125, 0.5);*/
          /*border-bottom: 3px solid rgba(0,0,0,0.9);
          border-top: 1px solid rgba(0,0,0,1);*/
          color: #ffffff;
          transition-property: background-color;
          transition-duration: .5s;
          border-radius: 0px;
        }

        window#waybar.hidden {
          opacity: 0.2;
        }

        /*
        window#waybar.empty {
          background-color: transparent;
        }
        window#waybar.solo {
          background-color: #FFFFFF;
        }
        */

        window#waybar.termite {
          background-color: #3F3F3F;
        }

        window#waybar.chromium {
          background-color: #000000;
          border: none;
        }

        button {
          /* Use box-shadow instead of border so the text isn't offset */
          box-shadow: inset 0 -3px transparent;
          /* Avoid rounded borders under each button name */
          border: none;
          border-radius: 0;
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
        }

      #workspaces button:hover {
          /*background: rgba(0, 0, 0, 0.2);*/
          /*background: linear-gradient(180deg, rgba(100,114,125,0.9) 0%, rgba(0,0,0,0.9) 100%);*/
          background: radial-gradient(circle, rgba(150,150,150,1) 0%, rgba(0,0,0,0) 100%);
        }

      #workspaces button.focused {
          /*background-color: #64727D;*/
          /*box-shadow: inset 0 -3px #ffffff;*/
          background: radial-gradient(circle, rgba(255,255,255,1) 0%, rgba(0,0,0,0) 100%);
          color: #000000;
        }

      #workspaces button.urgent {
          /*background-color: #eb4d4b;*/
          /*background: linear-gradient(0deg, rgba(0,0,0,1) 0%, rgba(235,77,75,1) 100%);*/
          background: radial-gradient(circle, rgba(231,77,75,1) 0%, rgba(0,0,0,0) 100%);

        }

      #mode {
          background-color: #64727D;
          border-bottom: 3px solid #ffffff;
        }

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
      #tray,
      #mode,
      #idle_inhibitor,
      #scratchpad,
      #mpd {
          padding: 0 10px;
          color: #ffffff;
        }

      #window,
      #workspaces {
          margin: 0 4px;
        }

      #window {
        padding: 0 5px;
        /*background: linear-gradient(180deg, rgba(255,255,255,0.5) 0%, rgba(120,120,120,0.5) 100%);*/
        border: 1px solid rgba(125,125,125,0.75);	
        background: radial-gradient(circle, rgba(70,70,70,0.5) 0%, rgba(0,0,0,0.5) 100%);
        color: #ffffff;
        }

      #waybar.empty #window {
        border: none;
        background: none;
        }

        /* If workspaces is the leftmost module, omit left margin */
        .modules-left > widget:first-child > #workspaces {
          margin-left: 0;
        }

        /* If workspaces is the rightmost module, omit right margin */
        .modules-right > widget:last-child > #workspaces {
          margin-right: 0;
        }

      #clock {
          /*background-color: #64727D;*/
              background: linear-gradient(0deg, rgba(0,0,0,1) 0%, rgba(100,114,125,1) 100%);
        }

      #battery {
          /*background-color: #ffffff;*/
          background: linear-gradient(180deg, rgba(255,255,255,1) 0%, rgba(162,162,162,1) 100%);
          color: #000000;
        }

      #battery.charging, #battery.plugged {
          color: #ffffff;
          /*background-color: #26A65B;*/
          background: linear-gradient(0deg, rgba(0,0,0,1) 0%, rgba(38,166,91,1) 100%);
        }

        @keyframes blink {
          to {
              background-color: #ffffff;
              color: #000000;
          }
        }

      #battery.critical:not(.charging) {
          background-color: #f53c3c;
          color: #ffffff;
          animation-name: blink;
          animation-duration: 0.5s;
          animation-timing-function: linear;
          animation-iteration-count: infinite;
          animation-direction: alternate;
        }

        label:focus {
          background-color: #000000;
        }

      #cpu {
          /* background-color: #2ecc71;
          color: #000000; */
          background: linear-gradient(0deg, rgba(0,0,0,1) 0%, rgba(46,204,113,1) 100%);
        }

      #memory {
          /* background-color: #9b59b6; */
          background: linear-gradient(0deg, rgba(0,0,0,1) 0%, rgba(155,89,182,1) 100%);
        }

      #disk {
          /* background-color: #964B00; */
          background: linear-gradient(0deg, rgba(0,0,0,1) 0%, rgba(150,75,0,1) 100%);
        }

      #backlight {
          /* background-color: #90b1b1; */
          background: linear-gradient(0deg, rgba(0,0,0,1) 0%, rgba(144,177,177,1) 100%);
        }

      #network {
          /* background-color: #2980b9; */
          background: linear-gradient(0deg, rgba(0,0,0,1) 0%, rgba(41,128,185,1) 100%);
        }

      #network.disconnected {
          /* background-color: #f53c3c; */
          background: linear-gradient(0deg, rgba(0,0,0,1) 0%, rgba(245,60,60,1) 100%);
        }

      #pulseaudio {
          /* background-color: #f1c40f; */
          background: linear-gradient(180deg, rgba(255,255,255,1) 0%, rgba(241,196,15,1) 100%);
          color: #000000;
        }

      #pulseaudio.muted {
          /* background-color: #90b1b1; */
          background: linear-gradient(180deg, rgba(255,255,255,1) 0%, rgba(144,177,177,1) 100%);
          color: #2a5c45;
        }

      #wireplumber {
          background-color: #fff0f5;
          color: #000000;
        }

      #wireplumber.muted {
          background-color: #f53c3c;
        }

      #custom-media {
          background-color: #66cc99;
          color: #2a5c45;
          min-width: 100px;
        }

      #custom-media.custom-spotify {
          background-color: #66cc99;
        }

      #custom-media.custom-vlc {
          background-color: #ffa000;
        }

      #temperature {
          /*background-color: #f0932b;*/
          background: linear-gradient(0deg, rgba(0,0,0,1) 0%, rgba(240,147,43,1) 100%);
        }

      #temperature.critical {
          /*background-color: #eb4d4b;*/
          background: linear-gradient(0deg, rgba(0,0,0,1) 0%, rgba(235,77,75,1) 100%);
        }

      #tray {
          /*background-color: #2980b9;*/
          background: linear-gradient(0deg, rgba(2,0,36,1) 0%, rgba(41,128,185,1) 100%);
        }

      #tray > .passive {
          -gtk-icon-effect: dim;
        }

      #tray > .needs-attention {
          -gtk-icon-effect: highlight;
          background-color: #eb4d4b;
        }

      #idle_inhibitor {
          /* background-color: #2d3436; */
          background: linear-gradient(0deg, rgba(0,0,0,1) 0%, rgba(45,52,54,1) 100%);
        }

      #idle_inhibitor.activated {
          /* background-color: #ecf0f1; */
          background: linear-gradient(0deg, rgba(255,255,255,1) 0%, rgba(236,240,241,1) 100%);
          color: #2d3436;
        }

      #language {
          /*background: #00b093;
          color: #740864;*/
          padding: 0 5px;
          margin: 0 5px;
          min-width: 16px;
          background: linear-gradient(0deg, rgba(0,0,0,1) 0%, rgba(0,176,147,1) 100%);
        }

      #keyboard-state {
          background: #97e1ad;
          color: #000000;
          padding: 0 0px;
          margin: 0 5px;
          min-width: 16px;
        }

      #keyboard-state > label {
          padding: 0 5px;
        }

      #keyboard-state > label.locked {
          background: rgba(0, 0, 0, 0.2);
        }

      #scratchpad {
          background: rgba(0, 0, 0, 0.2);
        }

      #scratchpad.empty {
        background-color: transparent;
        }
      '';
    };
  }
