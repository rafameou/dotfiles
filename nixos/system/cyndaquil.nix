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

  programs.steam = {
    enable = true;
    extraPackages = with pkgs; [
      gamescope
      steamtinkerlaunch
    ];
  };

  fileSystems = {
    "/mnt/arquivos-ssd" = {
      device = "/dev/disk/by-uuid/1c1dcfb2-8fba-470e-ac66-e65bf57da8a0";
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
  };

  programs.firejail.enable = true;
  programs.fuse.userAllowOther = true;
  services.ollama.enable = true;

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
