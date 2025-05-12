{ config, pkgs, inputs, ... }:
{
  imports = [ 
    ./mod/base.nix

    ./chikorita-hw.nix
    ./mod/boot.nix
    ./mod/nvidia-hell.nix

    #./mod/sway.nix
    ./mod/desktop-environment/kde.nix
    ./mod/navidrome.nix
    ./mod/ssh.nix
    #./mod/nextcloud.nix
  ];

  networking.hostName = "chikorita"; # Define your hostname.
  home-manager = {
    backupFileExtension = "hm-backup";
    extraSpecialArgs = { inherit inputs /*outputs*/; };
    users = {
      rafameou = import ../home-manager/chikorita.nix;
    };
  };

  /* ... changes to only this sytem */

  fileSystems = {
    "/mnt/Extra" = { 
      device = "/dev/disk/by-uuid/f2738fa6-3895-4e23-8d7f-f29314c3dd0e";
      fsType = "ext4";
      options = [
        "x-gvfs-show"
        "nofail"
        "exec"
      ];
    };
    /*"/mnt/Extra2" = { 
    device = "/dev/disk/by-uuid/30c8e8dd-7a12-449a-ae59-f26262c5a8ff";
    fsType = "ext4";
    };*/
  };

  services.gnome.gnome-remote-desktop.enable = true;
  systemd.sleep.extraConfig = ''
    AllowSuspend=no
    AllowHibernation=no
  '';


  programs.firejail.enable = true;
  programs.fuse.userAllowOther = true;
  services.ollama.enable = true;

  services.searx = {
    enable = true;
    environmentFile = "/home/rafameou/.searxng.env";
    settings = {
      server = {
        bind_address = "0.0.0.0";
      };
      search = {
        autocomplete = "duckduckgo";
        formats = ["html" "json" "rss"];
      };
    };
  };

  services.tailscale.useRoutingFeatures = "both";

  environment.systemPackages = [
    pkgs.screen
    pkgs.xdotool
    pkgs.xorg.xwininfo
    pkgs.yad
    pkgs.nodejs_23
  ];

  services.xserver.displayManager.setupCommands = ''
    ${pkgs.xorg.xrandr}/bin/xrandr --output eDP-1 --off
    ${pkgs.xorg.xrandr}/bin/xrandr --output HDMI-1 --mode 1920x1080
  '';

  systemd.tmpfiles.rules = [
    "L+ /run/gdm/.config/monitors.xml - - - - ${pkgs.writeText "gdm-monitors.xml" ''
      <monitors version="2">
      <configuration>
      <logicalmonitor>
      <x>0</x>
      <y>0</y>
      <scale>1</scale>
      <primary>yes</primary>
      <monitor>
        <monitorspec>
          <connector>HDMI-1</connector>
          <vendor>HJW</vendor>
          <product>MACROSILICON</product>
          <serial>0x0002e842</serial>
        </monitorspec>
        <mode>
          <width>1920</width>
          <height>1080</height>
          <rate>60.000</rate>
        </mode>
      </monitor>
      </logicalmonitor>
      <disabled>
      <monitorspec>
        <connector>eDP-1</connector>
        <vendor>CMN</vendor>
        <product>0x15dc</product>
        <serial>0x00000000</serial>
      </monitorspec>
      </disabled>
      </configuration>
      </monitors>
    ''}"
  ];

  programs.sway.extraOptions = [
    "--unsupported-gpu"
  ];

  programs.gamescope = {
    enable = true;
    env = {
      __NV_PRIME_RENDER_OFFLOAD = "1";
      __VK_LAYER_NV_optimus = "NVIDIA_only";
      __GLX_VENDOR_LIBRARY_NAME = "nvidia";
    };
  };

  programs.steam = {
    enable = true;
    extraPackages = with pkgs; [
      gamescope
      steamtinkerlaunch
    ];
  };

  # https://nixos.wiki/wiki/FAQ/When_do_I_update_stateVersion
  system.stateVersion = "23.05";

}
