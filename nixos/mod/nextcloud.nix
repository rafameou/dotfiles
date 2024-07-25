{ config, pkgs, ... }:
{
  services.nextcloud = {
    enable = true;
    #home = "/mnt/Extra2/nextcloud";
    hostName = "chikorita";
    package = pkgs.nextcloud29;
    config.adminpassFile = "/etc/nextcloud1";
  };
}
