{
  lib,
  inputs,
  pkgs,
  ...
}:
{
  imports = [
    inputs.home-manager.nixosModules.home-manager
    ./oddish-hw.nix
    ./mod/boot-pi.nix
    ./mod/desktop.nix
    ./mod/env.nix
    ./mod/user.nix
    ./mod/nix.nix
    ./mod/nixpkgs.nix
    ./mod/pipewire.nix
    #./mod/stylix.nix
    ./mod/time.nix
    ./mod/zsh.nix

    ./mod/greetd.nix
    ./mod/desktop-environment/lxqt.nix
  ];

  # ... changes to only this sytem
  networking.hostName = "oddish"; # Define your hostname.
  home-manager = {
    extraSpecialArgs = {
      inherit
        inputs # outputs
        ;
    };
    users = {
      rafameou = import ../home-manager/oddish.nix;
    };
  };

  zramSwap.enable = true; # included in ssd.nix

  services.openssh.enable = true;

  programs.fuse.userAllowOther = true;
  programs.firejail.enable = true;

  services.xrdp.enable = true;
  services.xrdp.defaultWindowManager = "startlxqt";
  services.xrdp.openFirewall = false;

  hardware.graphics = {
    enable32Bit = lib.mkDefault false;
  };

  # https://nixos.wiki/wiki/FAQ/When_do_I_update_stateVersion
  system.stateVersion = "24.05";

}
