{ pkgs, ... }:
{
  services.greetd = {
    enable = true;
    settings = {
      terminal = {
        vt = 1;
      };
      default_session = {
        command = "${pkgs.sway}/bin/sway --config /etc/wlgreet-sway.config";
        user = "greeter";
      };
    };
  };

  environment.etc."wlgreet-sway.config".text = ''
    exec "${pkgs.swaybg}/bin/swaybg -m fill -i /etc/greetd-splash.png"
    exec "${pkgs.wlgreet}/bin/wlgreet --command 'startxfce4 --wayland'; swaymsg exit"

    bindsym Mod4+shift+e exec swaynag \
    	-t warning \
    	-m 'What do you want to do?' \
    	-b 'Poweroff' 'systemctl poweroff' \
    	-b 'Reboot' 'systemctl reboot'

    include /etc/sway/config.d/*
  '';
}
