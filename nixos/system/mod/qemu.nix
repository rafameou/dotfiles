{ pkgs, inputs, ... }:
{
  virtualisation = {
    #useSecureBoot = true;
    libvirtd = {
      enable = true;
      qemu = {
        package = pkgs.qemu_kvm;
        swtpm.enable = true;
      };
    };
  };
  #https://github.com/ners/NixOS/blob/master/overlays/OVMF.nix
  # nixpkgs.overlays = [ (self: super: { OVMF = super.OVMF.override { secureBoot = true; tpmSupport = true; }; }) ];
  users.users.rafameou.extraGroups = [ "libvirtd" "kvm" ];
  programs.virt-manager.enable = true;
  environment.systemPackages = with pkgs; [
    #libguestfs #broken 18-07-2025
    virtiofsd
    spice-vdagent
    swtpm

    #inputs.winapps.packages."${system}".winapps
    #inputs.winapps.packages."${system}".winapps-launcher
  ];
}
