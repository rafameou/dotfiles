{lib, pkgs,...}:
{
  # https://github.com/rafaelrc7/dotfiles/blob/master/users/rafael/waybar.nix
  imports = [ ../nix-colors.nix ];

  programs.waybar = {
    enable = true;
    settings = [
    {
      layer = "bottom";
      position = "bottom";
      height = 24;#25;
      spacing = 5; #10;

      modules-left   = [ "custom/startmenu" "custom/scale" "custom/terminal" "custom/filebrowser" "custom/webbrowser" "custom/screenshot" "custom/close" "custom/maximize" "custom/fullscreen" "hyprland/workspaces" "sway/workspaces" "sway/mode" "sway/scratchpad" "custom/media" "sway/window" /*"wlr/taskbar"*/ ];
      modules-center = [  ];
      modules-right  = ["idle_inhibitor"  "pulseaudio" "backlight" "systemd-failed-units" /*"network" "hyprland/language" "sway/language"*/ "cpu" "memory" /*"user"*/ "battery" "privacy" "custom/weather" "custom/notification" "tray" "clock" "custom/logout"];

      "sway/workspaces" = {
        all-outputs = true;
        format = "{name}{icon}";
        format-icons = {
          "urgent" = "";
          "focused" = "";
          "default" = "";
        };
      };

      "sway/window" = {
        icon-size = 20;
        icon = true;
      };

      "custom/startmenu" = {
        format = " ";
        on-click = "fuzzel -a bottom-left";
      };

      "custom/scale" = {
        format = "󰍋 ";
        on-click = "${pkgs.lua}/bin/lua ${./change_res_sway.lua}";
      };

      "custom/terminal" = {
        format = " ";
        on-click = "foot";
      };

      "custom/filebrowser" = {
        format = " ";
        on-click = "pcmanfm-qt";
      };

      "custom/webbrowser" = {
        format = "󰖟 ";
        on-click = "qutebrowser";
      };

      "custom/screenshot" = {
        format = "󰄀 ";
        #on-click = "flameshot gui";
        on-click = "${pkgs.lua}/bin/lua ${./flameshot_bad_scale.lua}";
      };

      "custom/close" = {
        format = "󰧻 ";
        on-click = "swaymsg kill";
      };

      "custom/maximize" = {
        format = " ";
        on-click = "swaymsg gaps inner current toggle 10";
      };

      "custom/fullscreen" = {
        format = " ";
        on-click = "swaymsg fullscreen";
      };

      "custom/logout" = {
        format = "󰩈 ";
        on-click = "wlogout";
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
          "activated" = "<span color='#FABD2F'> </span>";
          "deactivated" = "<span color='#D3869B'></span>";
        };
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
          format = "{icon}  {capacity}% {power:.3}W</span>";
          format-charging = "<span color='#8EC07C'>󰂅  {capacity}% {power:.3}W</span>";
          format-plugged = "<span color='#8EC07C'>  {capacity}% {power:.3}W</span>";
          format-alt = "{time} {icon} ";
          format-icons = [
            "<span color='#FB4934'>" 
            "<span color='#FE8019'>" 
            "<span color='#8EC07C'>" 
            "<span color='#B8BB26'>" 
            "<span color='#B8BB26'>"
          ];
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

        "custom/notification"= {
          "tooltip"= false;
          "format"= "{icon}";
          "format-icons"= {
            "notification"= "<span color='#FABD2F'>*</span>";
            "none"= " ";
            "dnd-notification"= "<span color='#FABD2F'>*</span>";
            "dnd-none"= "";
            "inhibited-notification"= "<span color='#FB4934'>*</span>";
            "inhibited-none"= "";
            "dnd-inhibited-notification"= "<span color='#FB4934'>*</span>";
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

                      "wlr/taskbar" = {
          icon-size= 20;
          on-click = "activate";
          format = "{icon} {title}";
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

              cpu = {
        format = "{icon} {usage}%</span>";
        format-icons = [
          "<span color='#B8BB26'>▁" 
          "<span color='#8EC07C'>▂" 
          "<span color='#83A598'>▃" 
          "<span color='#FABD2F'>▄" 
          "<span color='#FE8019'>▅" 
          "<span color='#FE8019'>▆" 
          "<span color='#FB4934'>▇" 
          "<span color='#FB4934'>█"];
        tooltip = false;
      };

      memory = {
        format = "  {used} GiB";
      };

      temperature = {
        critical-threshold = 80;
        format = "{icon} {temperatureC}°C</span>";
        format-icons = [
          "<span color='#B8BB26'>"
          "<span color='#FABD2F'>" 
          "<span color='#FB4934'>"
        ];
        hwmon-path = "/sys/devices/platform/coretemp.0/hwmon/hwmon4/temp1_input";
      };

                user = {
          format = "{work_H}:{work_M}";
          weight = 20;
          height = 20;
          icon = true;
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
      transition-duration: 0;
      }

      window#waybar { 
      background: linear-gradient(180deg, rgba(50,48,47,0.9) 0%, rgba(29, 32, 33,1) 100%);
; /*rgba(50,48,47,0.9);*/
      color: #FBF1C7;
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
      border-radius: 0%;
      }

      #taskbar button.hover,
      #taskbar button.active {
       background: #32302F; 
      }

      button {
      box-shadow: inset 0 -3px transparent;
      border: none;
      border-radius: 100%;
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
        border-radius: 100%;
        transition-duration: .2s;
        background: #504945;
      }

      #workspaces button.active,
      #workspaces button.focused,
      #workspaces button:hover {
        /*background: #32302F;*/
        background: radial-gradient(circle, rgba(150,150,150,1) 0%, rgba(0,0,0,0) 100%);
        /*background: radial-gradient(circle, rgba(255,255,255,1) 0%, rgba(0,0,0,0) 100%);*/
        color: #FBF1C7;
      }

      #workspaces button.urgent {
        color: #FB4934;
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
        background: radial-gradient(circle, rgba(70,70,70,0.5) 0%, rgba(0,0,0,0) 100%);
      }

      #wireplumber.muted,
      #network.disconnected,
      #pulseaudio.muted {
        color: #FB4934;
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
