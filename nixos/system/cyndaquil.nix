{
  config,
  pkgs,
  inputs,
  ...
}:
{
  imports = [
    ./mod/base.nix

    ./cyndaquil-hw.nix
    ./mod/boot.nix

    ./mod/desktop-environment/xfce.nix
    ./mod/greetd.nix
    ./mod/sway.nix
    #./mod/niri.nix
    ./mod/labwc.nix
    ./mod/wayfire.nix

    ./mod/navidrome.nix
    ./mod/ssh.nix
  ];

  # ... changes to only this sytem
  networking.hostName = "cyndaquil"; # Define your hostname.
  home-manager = {
    backupFileExtension = "hm-backup";
    extraSpecialArgs = {
      inherit
        inputs # outputs
        ;
    };
    users = {
      rafameou = import ../home-manager/cyndaquil.nix;
    };
  };

  fileSystems = {
    "/mnt/arquivos-hdd2" = {
      device = "/dev/disk/by-uuid/683fe0b2-1633-44a2-8bc5-1b176fdd8c6c";
      fsType = "btrfs";
      options = [
        "x-gvfs-show"
        "nofail"
        "exec"
      ];
    };
    "/mnt/arquivos-hdd" = {
      device = "/dev/disk/by-uuid/633fc4e8-ca7d-4b25-b50b-cd819a53f801";
      fsType = "btrfs";
      options = [
        "x-gvfs-show"
        "nofail"
        "exec"
      ];
    };
    "/mnt/arquivos-nvme" = {
      device = "/dev/disk/by-uuid/392b4d2c-1a22-4002-b614-14c2811e165c";
      fsType = "btrfs";
      options = [
        "x-gvfs-show"
        "nofail"
        "exec"
      ];
    };
  };

  services.xserver.displayManager.lightdm.enable = false;
  # https://bcarpent.codes/posts/How_to_use_Gnome_Remote_Desktop_for_Headless_login/
  # https://discourse.nixos.org/t/configuring-remote-desktop-access-with-gnome-remote-desktop/48023/4
  # https://github.com/NixOS/nixpkgs/issues/361163
  services.gnome.gnome-remote-desktop.enable = true;
  systemd.services."gnome-remote-desktop".wantedBy = [ "graphical.target" ];
  systemd.sleep.extraConfig = ''
    AllowSuspend=no
    AllowHibernation=no
    AllowHybridSleep=no
    AllowSuspendThenHibernate=no
  '';

  programs.firejail.enable = true;
  programs.fuse.userAllowOther = true;
  services.ollama.enable = true;

  services.adguardhome.enable = true;
  services.adguardhome.openFirewall = true;
  networking.firewall.allowedTCPPorts = [ 53 ];
  networking.firewall.allowedUDPPorts = [ 53 ];

  environment.systemPackages = [
    pkgs.screen
    pkgs.xdotool
    pkgs.xorg.xwininfo
    pkgs.yad
    pkgs.nodejs_24
  ];

  services.searx = {
    enable = true;
    environmentFile = "/home/rafameou/.searxng.env";
    settings = {
      server = {
        bind_address = "0.0.0.0";
        port = "8888";
        secret_key = "$SEARX_SECRET_KEY";
      };
      search = {
        autocomplete = "duckduckgo";
        formats = [
          "html"
          "json"
          "rss"
        ];
      };
    };
  };

  services.freshrss = {
    enable = true;
    passwordFile = "/etc/insecure-password";
    baseUrl = "http://cyndaquil";
  };

  # https://nixos.wiki/wiki/FAQ/When_do_I_update_stateVersion
  system.stateVersion = "23.05";

}
