{ pkgs, ... }:
{
  services.greetd = {
    enable = true;
    settings = {
      default_session = {
        command = "${pkgs.sway}/bin/sway --config /etc/wlgreet-sway.config";
        user = "greeter";
      };
    };
  };

  environment.etc."wlgreet-sway.config".text = ''
    exec "${pkgs.wlgreet}/bin/wlgreet --command niri; swaymsg exit"

    bindsym Mod4+shift+e exec swaynag \
    	-t warning \
    	-m 'What do you want to do?' \
    	-b 'Poweroff' 'systemctl poweroff' \
    	-b 'Reboot' 'systemctl reboot'

    include /etc/sway/config.d/*
  '';
}
