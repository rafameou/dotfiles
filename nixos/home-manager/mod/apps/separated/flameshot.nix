{ config, ... }:
{
  services.flameshot = {
    enable = true;
    settings = {
      General = {
        showStartupLaunchMessage = false;
        disabledGrimWarning = true;
        uiColor = "#${config.colorScheme.palette.base00}";
      };
      Shortcuts = {
        TYPE_COPY = "Y";
      };
    };
  };
}
