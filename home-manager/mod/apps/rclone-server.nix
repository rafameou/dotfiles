{ pkgs, ... }:
let
  mount_directory = "/mnt/Extra2/gdrive_music";
in
  {
  home.packages = with pkgs; [ rclone fuse ];
  /*---------------------------------------------------------------------------------------------|
  | Stolen from https://github.com/rafaelrc7/dotfiles/blob/master/modules/home/rclone-gdrive.nix |
  |---------------------------------------------------------------------------------------------*/
  systemd.user.services = {
    rclone-gdrive-server = {
      Unit = {
        Description = "Autosync google drive folder using rclone";
        AssertPathIsDirectory = mount_directory;
        Wants = "network-online.target";
        After = "network-online.target";
      };

      Service = {
        Type = "simple";
        ExecStart = "${pkgs.rclone}/bin/rclone sync google:Música ${mount_directory}";
        #ExecStop = "${pkgs.fuse}/bin/fusermount -zu ${mount_directory}";
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
