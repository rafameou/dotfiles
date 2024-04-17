{ inputs, pkgs, lib, ... }:
{
  imports = [
    inputs.home-manager.nixosModules.home-manager
    ./bulbasaur-hw.nix
    ./mod/boot.nix
    ./mod/nix.nix
    ./mod/nixpkgs.nix
    ./mod/zsh.nix
    ./mod/bluetooth.nix
    ./mod/desktop.nix
    ./mod/qemu.nix
    ./mod/desktop-environment/gnome.nix
    ./mod/pipewire.nix
    ./mod/ssd.nix
    ./mod/time.nix
    ./mod/user.nix
    ./mod/printer.nix
    ./mod/distrobox.nix 
    ./mod/env.nix
  ];
  
  /* ... changes to only this sytem */
  networking.hostName = "bulbasaur"; # Define your hostname.
  home-manager = {
    extraSpecialArgs = { inherit inputs /*outputs*/; };
    users = {
      rafameou = import ../home-manager/bulbasaur.nix;
    };
  };

  fileSystems."/mnt/Extra" = { 
    device = "/dev/disk/by-uuid/30c8e8dd-7a12-449a-ae59-f26262c5a8ff";
    fsType = "ext4";
  };

  services.xrdp.enable = true;
  services.xrdp.defaultWindowManager = "gnome-session";
  #services.xrdp.openFirewall = true;

  services.openssh.enable = true;
  services.geoclue2.enable = true;
  programs.firejail.enable = true;
  programs.fuse.userAllowOther = true;

  environment.systemPackages = [
    pkgs.jellyfin
    pkgs.jellyfin-web
    pkgs.jellyfin-ffmpeg

    pkgs.xorg.xhost
  ];

  services.jellyfin = {
    enable = true;
    #openFirewall = true;
  };

    #fix distrobox
  environment.shellInit = ''
    [ -n "$DISPLAY" ] && xhost +si:localhost:$USER || true
    '';

  # https://nixos.wiki/wiki/FAQ/When_do_I_update_stateVersion
  system.stateVersion = "23.05";
}
