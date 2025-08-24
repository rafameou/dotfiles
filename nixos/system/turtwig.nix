{ config, pkgs, inputs, ... }:
{
  imports = [
    ./mod/base.nix

    ./turtwig-hw.nix
    ./mod/boot.nix

    ./mod/desktop-environment/kde.nix
  ];

  # ... changes to only this sytem
  networking.hostName = "turtwig"; # Define your hostname.
  home-manager = {
    backupFileExtension = "hm-backup";
    extraSpecialArgs = {
      inherit
        inputs # outputs
        ;
    };
    users = {
      rafameou = import ../home-manager/turtwig.nix;
    };
  };

  services.hardware.openrgb = {
  	enable = true;
	package = pkgs.openrgb-with-all-plugins;
  };

  services.udev.extraRules = ''
	SUBSYSTEMS=="usb", ATTRS{idVendor}=="5131", ATTRS{idProduct}=="2007", MODE="0666"
  '';

  # https://discourse.nixos.org/t/best-way-to-handle-boot-extramodulepackages-kernel-module-conflict/30729/4
  boot.extraModulePackages = with config.boot.kernelPackages; [
    it87
  ];
  boot.kernelParams = [ "acpi_enforce_resources=lax" ];
  boot.kernelModules = [
    "coretemp"
    "it87"
  ];
  boot.extraModprobeConfig = ''
    options it87 force_id=0x8628
  '';

  programs.steam = {
    enable = true;
    extraPackages = with pkgs; [
      gamescope
      steamtinkerlaunch
    ];
  };

  fileSystems = {
    "/mnt/Extra" = {
      device = "/dev/disk/by-uuid/7d9b7793-c0a9-4efb-ba89-ce747a2c3f6f";
      fsType = "ext4";
      options = [
        "x-gvfs-show"
        "nofail"
        "exec"
      ];
    };
  };

  services.ollama.enable = true;

  # https://nixos.wiki/wiki/FAQ/When_do_I_update_stateVersion
  system.stateVersion = "23.05";

}
