{ inputs, lib, config, pkgs, ... }:
{
  virtualisation.libvirtd = {
    enable = true;
    qemu = {
      ovmf = {
        enable = true;
        #packages = [ pkgs.OVMFFull ];
      };
      swtpm.enable = true;
    };
  };
  #https://github.com/ners/NixOS/blob/master/overlays/OVMF.nix
  nixpkgs.overlays = [ (self: super: { OVMF = super.OVMF.override { secureBoot = true; tpmSupport = true; }; }) ];
  users.users.rafameou.extraGroups = [ "libvirtd" ];
  programs.virt-manager.enable = true;
  environment.systemPackages = with pkgs; [
    libguestfs
    spice-vdagent
    swtpm
  ];
}
