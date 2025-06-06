# This is your home-manager configuration file
# Use this to configure your home environment (it replaces ~/.config/nixpkgs/home.nix)

{ ... }:
{
  # You can import other home-manager modules here
  imports = [
    # If you want to use home-manager modules from other flakes (such as nix-colors):
    # inputs.nix-colors.homeManagerModule
    ../../system/mod/nixpkgs.nix
  ];

  home = {
    username = "rafameou";
    homeDirectory = "/home/rafameou";
  };

  # Enable home-manager and git
  programs.home-manager.enable = true;
  #programs.git.enable = true;

  # Nicely reload system units when changing configs
  systemd.user.startServices = "sd-switch";

  # https://nixos.wiki/wiki/FAQ/When_do_I_update_stateVersion
  home.stateVersion = "23.05";
}
