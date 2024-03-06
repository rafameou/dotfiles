{ inputs, pkgs, ... }:
{
  imports = [ 
      inputs.home-manager.nixosModules.home-manager
      ./oddish-hw.nix
      ./mod/boot-pi.nix
      ./mod/env.nix
      ./mod/user.nix
      ./mod/home-manager-server.nix
      ./mod/nix.nix
      ./mod/nixpkgs.nix
      ./mod/time.nix
      ./mod/zsh.nix
    ];

  /* ... changes to only this sytem */
  networking.hostName = "oddish"; # Define your hostname.
  home-manager = {
    extraSpecialArgs = { inherit inputs /*outputs*/; };
    users = {
      rafameou = import ../home-manager/oddish.nix;
    };
  };

  zramSwap.enable = true; # included in ssd.nix

  services.openssh.enable = true;

  programs.fuse.userAllowOther = true;
  programs.firejail.enable = true;
  environment.systemPackages = [
    pkgs.jellyfin
    pkgs.jellyfin-web
    pkgs.jellyfin-ffmpeg
  ];

  services.jellyfin = {
    enable = true;
    openFirewall = true;
  };

  # https://nixos.wiki/wiki/FAQ/When_do_I_update_stateVersion
  system.stateVersion = "24.05";

}
