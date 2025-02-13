{ config, pkgs, ... }:
{
  environment.systemPackages = with pkgs; [ navidrome ];

  systemd.services = {
    navidrome-server = {
      unitConfig = {
        Type = "simple";
        Description = "";
        AssertPathExists = "/etc/navidrome.toml";
        Wants = "network-online.target";
        After = "network-online.target";
      };
      serviceConfig = {
        ExecStart = "${pkgs.navidrome}/bin/navidrome --configfile /etc/navidrome.toml";
      };
      wantedBy = [ "multi-user.target" ];
    };
  };
}
