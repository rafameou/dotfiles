{ config, pkgs, ... }:
let
  mount_directory_gdrive = "${config.home.homeDirectory}/GoogleDrive";
  mount_directory_mega = "${config.home.homeDirectory}/Mega";
  mount_directory_onedrive = "${config.home.homeDirectory}/OneDrive";
  mount_directory_koofr = "${config.home.homeDirectory}/Koofr";
  mount_directory_proton = "${config.home.homeDirectory}/ProtonDrive";
in
{
  home.packages = with pkgs; [
    rclone
    fuse3
  ];
  /*
    ---------------------------------------------------------------------------------------------|
    | Stolen from https://github.com/rafaelrc7/dotfiles/blob/master/modules/home/rclone-gdrive.nix |
    |---------------------------------------------------------------------------------------------
  */
  systemd.user.services = {
    rclone-gdrive = {
      Unit = {
        Description = "Automount google drive folder using rclone";
        AssertPathIsDirectory = mount_directory_gdrive;
        Wants = "network-online.target";
        After = "network-online.target";
      };

      Service = {
        Type = "simple";
        ExecStart = "${pkgs.rclone}/bin/rclone mount --vfs-cache-mode full  --transfers=45 --checkers=45 google: ${mount_directory_gdrive}";
        ExecStop = "${pkgs.fuse}/bin/fusermount -zu ${mount_directory_gdrive}";
        Restart = "on-failure";
        RestartSec = 30;
        KillMode = "process";
        TimeoutSec = 5;
        /*
          --------------------------------------------------------------------------------|
          | https://discourse.nixos.org/t/fusermount-systemd-service-in-home-manager/5157/4 |
          |---------------------------------------------------------------------------------
        */
        Environment = [ "PATH=/run/wrappers/bin/:$PATH" ];
      };

      Install = {
        WantedBy = [ "default.target" ];
      };
    };
    rclone-mega = {
      Unit = {
        Description = "Automount mega folder using rclone";
        AssertPathIsDirectory = mount_directory_mega;
        Wants = "network-online.target";
        After = "network-online.target";
      };

      Service = {
        Type = "simple";
        ExecStart = "${pkgs.rclone}/bin/rclone mount --vfs-cache-mode full  --transfers=45 --checkers=45 mega: ${mount_directory_mega}";
        ExecStop = "${pkgs.fuse}/bin/fusermount -zu ${mount_directory_mega}";
        Restart = "on-failure";
        RestartSec = 30;
        KillMode = "process";
        TimeoutSec = 5;
        /*
          --------------------------------------------------------------------------------|
          | https://discourse.nixos.org/t/fusermount-systemd-service-in-home-manager/5157/4 |
          |---------------------------------------------------------------------------------
        */
        Environment = [ "PATH=/run/wrappers/bin/:$PATH" ];
      };

      Install = {
        WantedBy = [ "default.target" ];
      };
    };
    rclone-onedrive = {
      Unit = {
        Description = "Automount onedrive folder using rclone";
        AssertPathIsDirectory = mount_directory_onedrive;
        Wants = "network-online.target";
        After = "network-online.target";
      };

      Service = {
        Type = "simple";
        ExecStart = "${pkgs.rclone}/bin/rclone mount --vfs-cache-mode full  --transfers=45 --checkers=45 onedrive: ${mount_directory_onedrive}";
        ExecStop = "${pkgs.fuse}/bin/fusermount -zu ${mount_directory_onedrive}";
        Restart = "on-failure";
        RestartSec = 30;
        KillMode = "process";
        TimeoutSec = 5;
        /*
          --------------------------------------------------------------------------------|
          | https://discourse.nixos.org/t/fusermount-systemd-service-in-home-manager/5157/4 |
          |---------------------------------------------------------------------------------
        */
        Environment = [ "PATH=/run/wrappers/bin/:$PATH" ];
      };

      Install = {
        WantedBy = [ "default.target" ];
      };
    };
    rclone-koofr = {
      Unit = {
        Description = "Automount onedrive folder using rclone";
        AssertPathIsDirectory = mount_directory_koofr;
        Wants = "network-online.target";
        After = "network-online.target";
      };

      Service = {
        Type = "simple";
        ExecStart = "${pkgs.rclone}/bin/rclone mount --vfs-cache-mode full  --transfers=45 --checkers=45 koofr: ${mount_directory_koofr}";
        ExecStop = "${pkgs.fuse}/bin/fusermount -zu ${mount_directory_koofr}";
        Restart = "on-failure";
        RestartSec = 30;
        KillMode = "process";
        TimeoutSec = 5;
        /*
          --------------------------------------------------------------------------------|
          | https://discourse.nixos.org/t/fusermount-systemd-service-in-home-manager/5157/4 |
          |---------------------------------------------------------------------------------
        */
        Environment = [ "PATH=/run/wrappers/bin/:$PATH" ];
      };

      Install = {
        WantedBy = [ "default.target" ];
      };
    };
    rclone-proton = {
      Unit = {
        Description = "Automount onedrive folder using rclone";
        AssertPathIsDirectory = mount_directory_proton;
        Wants = "network-online.target";
        After = "network-online.target";
      };

      Service = {
        Type = "simple";
        ExecStart = "${pkgs.rclone}/bin/rclone mount --vfs-cache-mode full  --transfers=45 --checkers=45 proton: ${mount_directory_proton}";
        ExecStop = "${pkgs.fuse}/bin/fusermount -zu ${mount_directory_proton}";
        Restart = "on-failure";
        RestartSec = 30;
        KillMode = "process";
        TimeoutSec = 5;
        /*
          --------------------------------------------------------------------------------|
          | https://discourse.nixos.org/t/fusermount-systemd-service-in-home-manager/5157/4 |
          |---------------------------------------------------------------------------------
        */
        Environment = [ "PATH=/run/wrappers/bin/:$PATH" ];
      };

      Install = {
        WantedBy = [ "default.target" ];
      };
    };
  };
}
