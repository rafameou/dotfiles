{ ... }:
{
  # trimm
  services.fstrim = {
    enable = true;
    interval = "weekly"; # the default
  };

  zramSwap.enable = true;
}
