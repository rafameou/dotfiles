{ config, pkgs, ... }:
let
  mount_directory = "${config.home.homeDirectory}/GoogleDrive";
in
{
  home.packages = with pkgs; [ rclone fuse3 ];
  /*---------------------------------------------------------------------------------------------|
  | Stolen from https://github.com/rafaelrc7/dotfiles/blob/master/modules/home/rclone-gdrive.nix |
  |---------------------------------------------------------------------------------------------*/
  systemd.user.services = {
    rclone-gdrive = {
      Unit = {
        Description = "Automount google drive folder using rclone";
        AssertPathIsDirectory = mount_directory;
        Wants = "network-online.target";
        After = "network-online.target";
      };

      Service = {
        Type = "simple";
        ExecStart = "${pkgs.rclone}/bin/rclone mount --vfs-cache-max-age 2147483647w --vfs-cache-mode full google: ${mount_directory}";
        ExecStop = "${pkgs.fuse}/bin/fusermount -zu ${mount_directory}";
        Restart = "on-failure";
        RestartSec = 30;
        /*--------------------------------------------------------------------------------|
        | https://discourse.nixos.org/t/fusermount-systemd-service-in-home-manager/5157/4 |
        |---------------------------------------------------------------------------------*/
        Environment = [ "PATH=/run/wrappers/bin/:$PATH" ];
      };

      Install = {
        WantedBy = [ "default.target" ];
      };
    };
  };
}
