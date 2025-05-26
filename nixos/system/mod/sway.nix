{ pkgs, ... }:
{
  services.xserver.displayManager.startx.enable = true;
  services.xserver.displayManager.lightdm.enable = false;
  # services.displayManager.ly = {
  #   enable = true;
  #   settings = {
  #     animation = "doom";
  #     clock = "%c";
  #     initial_info_text = "(42) 98402-6139 rafameow@proton.me";
  #     vi_mode = "false";
  #     min_refresh_delta = "500";
  #   };
  # };
  #enable sway
  programs.sway = {
    enable = true;
    #package = null;
  };
  #programs.hyprland.enable = true; # enable Hyprland
  services.displayManager.sessionPackages = [ pkgs.sway ];
  #Enable Keyring for stuff like github-desktop
  services.gnome.gnome-keyring.enable = true;
  #programs.seahorse.enable = true;

  # pcmanfm
  services.udisks2.enable = true;
  services.gvfs.enable = true;

  security.polkit.enable = true;
  security.pam.services.swaylock = { };

  environment.sessionVariables.NIXOS_OZONE_WL = "1";
}
