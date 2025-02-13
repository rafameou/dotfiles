{...}:
{
  programs.i3status-rust = {
    enable = true;
    bars = {
      bottom = {
        theme = "native";
        icons = "awesome6";
        blocks = [
          {
            block = "sound";
            headphones_indicator = true;
            click = [
              {
                button = "left";
                cmd = "pavucontrol-qt";
              }
            ];
          }
          {
            block = "sound";
            device_kind = "source";
          }
          {
            block = "privacy";
            driver = [
              {
                name = "v4l";
              }
              /*{
                name = "pipewire";
              }*/
            ];
          }
          {
            block = "temperature";
            format = " $icon $max ";
          }
          { 
            block = "memory"; 
            format = " $icon $mem_used.eng(prefix:Mi)/$mem_total.eng(prefix:Mi) ";
          }
          {
            block = "memory";
            format = " $icon_swap $swap_used.eng(prefix:Mi)/$swap_total.eng(prefix:Mi) ";
          }
          { 
            block = "cpu";
            format = " $icon $utilization{ $boost|} ";
          }
          { 
            block = "net";
            format = " $icon $ip ";
            format_alt = " $icon {$ssid($signal_strength $frequency)|Wired} via $device ";
            interval = 10;
          }
          { block = "backlight"; }
          {
            block = "uptime";
          }
          /*{
          block = "toggle";
          format = " LOCK $icon ";
          command_state = ''[[ $(systemctl --user is-active swayidle) == "active" ]] && echo "ok" || echo ""'';
          command_on = "systemctl --user start swayidle";
          command_off = "systemctl --user stop swayidle";
          }*/
          { 
            block = "battery";
            format = " $icon $percentage {($power) |}";
            full_format = " $icon {$power |}";
          }
          { 
            block = "time"; 
            interval = 10;
            format = {
              full = " $icon $timestamp.datetime(f:'%a %d/%m %R:%S', l:pt_BR) ";
              short = " $icon $timestamp.datetime(f:%R) ";
            };
          }
          { 
            block = "notify"; 
            format = " $icon {($notification_count.eng(w:1)) |}";
            driver = "swaync";
            click = [
              {
                button = "left";
                action = "show";
              }
              {
                button = "right";
                action = "toggle_paused";
              }
            ];
          }
        ];
      };
    };
  }; 
}
