{...}:
{
  programs.i3status-rust = {
    enable = true;
    bars = {
      top = {
        theme = "native";
        icons = "material-nf";
        blocks = [
          {
            block = "sound";
            headphones_indicator = true;
            click = [
              {
                button = "left";
                cmd = "pavucontrol";
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
            block = "kdeconnect";
          }
          /*{
            block = "temperature";
            interval = 10;
            format = " $icon $max" ;
            inputs = ["Core 0" "CPU"];
            chip = "*-isa-*";
          }*/
          { block = "disk_space"; }
          { 
            block = "memory"; 
            format = " $icon $mem_used.eng(prefix:Mi)/$mem_total.eng(prefix:Mi) ";
          }
          {
            block = "memory";
            format = " $icon_swap $swap_used.eng(prefix:Mi)/$swap_total.eng(prefix:Mi) ";
          }
          { block = "cpu"; }
          { 
            block = "net";
            format = " $icon {$ssid($signal_strength)|Wired} ";
            format_alt = " $icon {$ssid($signal_strength $frequency)|Wired} via $device ";
            interval = 10;
          }
          { block = "backlight"; }
          {
            block = "uptime";
            interval = 3600;
          }
          /*{
          block = "toggle";
          format = " LOCK $icon ";
          command_state = ''[[ $(systemctl --user is-active swayidle) == "active" ]] && echo "ok" || echo ""'';
          command_on = "systemctl --user start swayidle";
          command_off = "systemctl --user stop swayidle";
          }*/
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
          { block = "battery"; }
          { 
            block = "time"; 
            interval = 10;
            format = {
              full = " $icon $timestamp.datetime(f:'%a %d/%m %R:%S', l:pt_BR) ";
              short = " $icon $timestamp.datetime(f:%R) ";
            };
          }
        ];
      };
    };
  }; 
}
