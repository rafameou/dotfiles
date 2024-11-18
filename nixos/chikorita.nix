{ config, pkgs, inputs, ... }:
{
  imports = [ 
    inputs.home-manager.nixosModules.home-manager
    ./chikorita-hw.nix
    ./mod/boot.nix
    ./mod/nix.nix
    ./mod/nixpkgs.nix
    ./mod/zsh.nix
    ./mod/bluetooth.nix
    ./mod/desktop.nix
    #./mod/qemu.nix 
    ./mod/pipewire.nix
    ./mod/nvidia-hell.nix
    ./mod/ssd.nix
    ./mod/time.nix
    ./mod/user.nix
    ./mod/printer.nix
    ./mod/distrobox.nix 
    ./mod/env.nix
    ./mod/flatpak.nix
    ./mod/sway.nix

    #./mod/navidrome.nix
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
      device = "/dev/disk/by-uuid/167b330f-ec39-4481-a35d-eb8894d14553";
      fsType = "btrfs";
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

  services.geoclue2.enable = true;

  services.gnome.gnome-remote-desktop.enable = true;
  systemd.sleep.extraConfig = ''
    AllowSuspend=no
    AllowHibernation=no
  '';

  services.openssh.enable = true;
  services.openssh.openFirewall = false;
  programs.firejail.enable = true;
  programs.fuse.userAllowOther = true;

  environment.systemPackages = [
    pkgs.screen
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
    ];
  };

  # https://nixos.wiki/wiki/FAQ/When_do_I_update_stateVersion
  system.stateVersion = "23.05";

}
