{ pkgs, ... }:
{
  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.rafameou = {
    isNormalUser = true;
    description = "Rafael Mazzutti";
    extraGroups = [
      "audio"
      "networkmanager"
      "wheel"
    ];
  };

  documentation = {
    enable = true;
    dev.enable = true;
    doc.enable = true;
    info.enable = true;
    man.enable = true;
    nixos.enable = true;
  };

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    man-pages
    man-pages-posix
    git
    vim
    wget
    home-manager
    nix-output-monitor
  ];
}
