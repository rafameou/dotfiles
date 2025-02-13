{ pkgs, inputs, ... }:
{
  virtualisation = {
    #useSecureBoot = true;
    libvirtd = {
      enable = true;
      qemu = {
        package = pkgs.qemu_kvm;
        ovmf = {
          enable = true;
          packages = [ pkgs.OVMFFull.fd ];
        };
        swtpm.enable = true;
      };
    };
  };
  #https://github.com/ners/NixOS/blob/master/overlays/OVMF.nix
  /*nixpkgs.overlays = [ (self: super: { OVMF = super.OVMF.override { secureBoot = true; tpmSupport = true; }; }) ];*/
  users.users.rafameou.extraGroups = [ "libvirtd" ];
  programs.virt-manager.enable = true;
  environment.systemPackages = with pkgs; [
    libguestfs
    virtiofsd
    spice-vdagent
    swtpm
  ];
}
