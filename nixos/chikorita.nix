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
    ./mod/qemu.nix 
    ./mod/pipewire.nix
    ./mod/nvidia-hell.nix
    ./mod/ssd.nix
    ./mod/time.nix
    ./mod/user.nix
    ./mod/printer.nix
    ./mod/distrobox.nix 
    ./mod/env.nix
    ./mod/flatpak.nix
    ./mod/desktop-environment/gnome.nix

    ./mod/navidrome.nix
  ];

  networking.hostName = "chikorita"; # Define your hostname.
  home-manager = {
    extraSpecialArgs = { inherit inputs /*outputs*/; };
    users = {
      rafameou = import ../home-manager/chikorita.nix;
    };
  };

  /* ... changes to only this sytem */

  fileSystems = {
    "/mnt/Extra" = { 
      device = "/dev/disk/by-uuid/41785370-fb0f-4504-81a2-d9bf1b895fb5";
      fsType = "ext4";
    };
    "/mnt/Extra2" = { 
      device = "/dev/disk/by-uuid/30c8e8dd-7a12-449a-ae59-f26262c5a8ff";
      fsType = "ext4";
    };
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

  /*services.navidrome = {
    enable = true;
    settings = {
      MusicFolder = "/mnt/Extra2/gdrive_music";
    };
  };*/

  environment.systemPackages = [
    pkgs.screen
    pkgs.navidrome
  ];

  # https://nixos.wiki/wiki/FAQ/When_do_I_update_stateVersion
  system.stateVersion = "23.05";

}
