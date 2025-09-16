{ lib, pkgs, ... }:
{
  imports = [
    ./mod/home-manager.nix
    ./mod/nix-colors.nix
    ./mod/xdg-gnome.nix
    ./mod/zsh.nix

    ./mod/apps/edit.nix
    ./mod/apps/games.nix
    ./mod/apps/internet.nix
    ./mod/apps/tools.nix
    #./mod/apps/separated/retroarch.nix
    #./mod/apps/separated/rclone-server.nix

    # - sway -
    # ./mod/window-manager.nix
    # - other desktops -
    ./mod/desktop-environment.nix
    ./mod/desktop-environment/gnome.nix
    #./mod/desktop-environment/kde.nix
    #./mod/desktop-environment/mate.nix
    #./mod/desktop-environment/xfce.nix
    #./mod/desktop-environment/lxqt.nix
  ];

  home.packages = with pkgs; [
    usbutils
  ];

  systemd.user = {
    targets = {
      #https://garajau.com.br/2022/08/systemd-suspend-user-level
      suspend = {
        Unit = {
          StopWhenUnneeded = "yes";
        };
      };
    };
    services = {
      cpu-cooler-display = {
        Service = {
          Type = "simple";
          ExecStart = "${
            (pkgs.python312.withPackages (python-pkgs: [
              python-pkgs.hidapi
              python-pkgs.psutil
            ]))
          }/bin/python /home/rafameou/GitHub/cpu-cooler-pichau-sage-v3/cpu_cooler.py";
          Restart = "on-failure";
          RestartSec = 5;
        };

        Install = {
          WantedBy = [ "default.target" ];
        };
      };
      cpu-cooler-restart-facepalm = {
        Unit = {
          After = "suspend.target";
        };
        Service = {
          Type = "oneshot";
          ExecStart = "${pkgs.systemd}/bin/systemctl --user restart cpu-cooler-display.service";
        };
        Install = {
          WantedBy = [ "suspend.target" ];
        };
      };
    };
  };

  # ... changes to only this sytem
}
