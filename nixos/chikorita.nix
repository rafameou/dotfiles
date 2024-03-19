{ inputs, ... }:
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
    ./mod/sway.nix
    ./mod/desktop-environment/mate.nix
    ./mod/pipewire.nix
    ./mod/nvidia-hell.nix
    ./mod/ssd.nix
    ./mod/time.nix
    ./mod/user.nix
    ./mod/printer.nix
    ./mod/distrobox.nix 
    ./mod/env.nix
  ];

  networking.hostName = "chikorita"; # Define your hostname.
  home-manager = {
    extraSpecialArgs = { inherit inputs /*outputs*/; };
    users = {
      rafameou = import ../home-manager/chikorita.nix;
    };
  };

  /* ... changes to only this sytem */

  fileSystems."/mnt/Extra" = { 
    device = "/dev/disk/by-uuid/41785370-fb0f-4504-81a2-d9bf1b895fb5";
    fsType = "ext4";
  };

  services.geoclue2.enable = true;

  # https://nixos.wiki/wiki/FAQ/When_do_I_update_stateVersion
  system.stateVersion = "23.05";

}
