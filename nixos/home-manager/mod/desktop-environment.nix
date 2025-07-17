{ pkgs, stylix, ... }:
{
  home.packages = with pkgs; [
    killall
    android-file-transfer
  ];

  # systemd.user.services = {
  #   wayland-idle-pipewire-inhibit-serv = {
  #     Unit = {
  #       Wants = "graphical-session.target";
  #       After = "graphical-session.target";
  #     };

  #     Service = {
  #       Type = "simple";
  #       ExecStart = "${pkgs.wayland-pipewire-idle-inhibit}/bin/wayland-pipewire-idle-inhibit -d 5 -b";
  #       Restart = "on-failure";
  #       RestartSec = 30;
  #     };

  #     Install = {
  #       WantedBy = [ "graphical-session.target" ];
  #     };
  #   };
  # };

  /*
    stylix = {
    enable = true;
    autoEnable = false;
    targets = {
    i3.enable = true;
    nixvim.enable = true;
    sway.enable = true;
    vim.enable = true;
    vscode.enable = true;
    zathura.enable = true;
    };
    };
  */
}
