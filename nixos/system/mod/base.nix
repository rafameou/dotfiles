{ pkgs, inputs, ... }:
{
  imports = [
    # -- home-manager --
    inputs.home-manager.nixosModules.home-manager

    # -- nix and nixpkgs configs --
    ./nix.nix
    ./nixpkgs.nix

    # -- hardware-related --
    ./bluetooth.nix
    ./swap.nix
    ./fstrim.nix
    ./fwupd.nix
    ./graphics.nix

    # -- user and desktop --
    ./xserver.nix
    ./dconf.nix
    ./fonts.nix
    ./pipewire.nix
    ./time.nix
    ./user.nix
    ./env.nix
    ./dbus.nix
    ./thumbnail.nix
    #./stylix.nix

    # -- services and apps --
    ./geoclue.nix
    ./zsh.nix
    ./solaar.nix
    ./qemu.nix
    #./distrobox.nix
    #./flatpak.nix #extremely annoying and keep breaking
    ./printer.nix
    ./tailscale.nix
  ];

  services.flatpak.enable = true;
}
