{ inputs, lib, config, pkgs, ... }:
{
  # Enable CUPS to print documents.
  services.printing.enable = true;
  services.printing.drivers = [ pkgs.hplipWithPlugin ];
  hardware.sane.enable = true;
  hardware.sane.extraBackends = [ pkgs.hplipWithPlugin ];

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.rafameou = {
    isNormalUser = true;
    description = "Rafael Mazzutti";
    extraGroups = [ "networkmanager" "wheel" ];
  };

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    git
    vim
    wget
    home-manager
    nix-output-monitor
  ];
}