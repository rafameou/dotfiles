{ inputs, pkgs, lib, ... }:
{
  imports = [
    inputs.home-manager.nixosModules.home-manager
    ./bulbasaur-hw.nix
    ./mod/boot-grub.nix
    ./mod/nix.nix
    ./mod/nixpkgs.nix
    ./mod/zsh.nix
    #./mod/bluetooth.nix
    ./mod/desktop.nix
    #./mod/qemu.nix 
    ./mod/pipewire.nix
    ./mod/ssd.nix
    ./mod/time.nix
    ./mod/user.nix
    ./mod/printer.nix
    ./mod/distrobox.nix 
    ./mod/env.nix
    ./mod/flatpak.nix
    ./mod/sway.nix
  ];

  #nixpkgs.overlays = [(final: prev: { hyprland = prev.hyprland.override { legacyRenderer = true; };})];
  
  /* ... changes to only this sytem */
  networking.hostName = "bulbasaur"; # Define your hostname.
  home-manager = {
    backupFileExtension = "hm-backup";
    extraSpecialArgs = { inherit inputs /*outputs*/; };
    users = {
      rafameou = import ../home-manager/bulbasaur.nix;
    };
  };

  #https://forums.linuxmint.com/viewtopic.php?t=427633
  boot.kernelParams = ["tsc=unstable"];

  services.geoclue2.enable = true;

  # https://nixos.wiki/wiki/FAQ/When_do_I_update_stateVersion
  system.stateVersion = "23.05";
}
