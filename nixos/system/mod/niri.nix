{ inputs, pkgs, ... }:
{
  nixpkgs.overlays = [ inputs.niri.overlays.niri ];
  programs.niri.enable = true;
  programs.niri.package = pkgs.niri; #if it decides to rebuild the entire f thing
  systemd.user.services.niri-flake-polkit.enable = true; 
  environment.systemPackages = with pkgs; [
    xwayland-satellite
  ];
}
