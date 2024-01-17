{ inputs, lib, config, pkgs, ... }:
{
  programs.zathura = {
    enable = true;
    options = {
      /* https://github.com/catppuccin/zathura/blob/main/src/catppuccin-frappe */
      recolor = true;
      /*default-fg = "#C6D0F5";
      default-bg = "#303446";

      completion-bg = "#414559";
      completion-fg = "#C6D0F5";
      completion-highlight-bg = "#575268";
      completion-highlight-fg = "#C6D0F5";
      completion-group-bg = "#414559";
      completion-group-fg = "#8CAAEE";

      statusbar-fg = "#C6D0F5";
      statusbar-bg = "#414559";

      notification-bg = "#414559";
      notification-fg = "#C6D0F5";
      notification-error-bg = "#414559";
      notification-error-fg = "#E78284";
      notification-warning-bg = "#414559";
      notification-warning-fg = "#FAE3B0";

      inputbar-fg = "#C6D0F5";
      inputbar-bg = "#414559";

      recolor-lightcolor = "#303446";
      recolor-darkcolor = "#C6D0F5";

      index-fg = "#C6D0F5";
      index-bg = "#303446";
      index-active-fg = "#C6D0F5";
      index-active-bg = "#414559";

      render-loading-bg = "#303446";
      render-loading-fg = "#C6D0F5";

      highlight-color = "#575268";
      highlight-fg = "#F4B8E4";
      highlight-active-color = "#F4B8E4";*/

      /* https://github.com/eastack/zathura-gruvbox/blob/master/zathura-gruvbox-dark  */
      notification-error-bg       = "#282828"; # bg
      notification-error-fg       = "#fb4934"; # bright:red
      notification-warning-bg     = "#282828"; # bg
      notification-warning-fg     = "#fabd2f"; # bright:yellow
      notification-bg             = "#282828"; # bg
      notification-fg             = "#b8bb26"; # bright:green

      completion-bg               = "#504945"; # bg2
      completion-fg               = "#ebdbb2"; # fg
      completion-group-bg         = "#3c3836"; # bg1
      completion-group-fg         = "#928374"; # gray
      completion-highlight-bg     = "#83a598"; # bright:blue
      completion-highlight-fg     = "#504945"; # bg2

      /* Define the color in index mode */
      index-bg                    = "#504945"; # bg2
      index-fg                    = "#ebdbb2"; # fg
      index-active-bg             = "#83a598"; # bright:blue
      index-active-fg             = "#504945"; # bg2

      inputbar-bg                 = "#282828"; # bg
      inputbar-fg                 = "#ebdbb2"; # fg

      statusbar-bg                = "#504945"; # bg2
      statusbar-fg                = "#ebdbb2"; # fg

      highlight-color             = "#fabd2f"; # bright:yellow
      highlight-active-color      = "#fe8019"; # bright:orange

      default-bg                  = "#282828"; # bg
      default-fg                  = "#ebdbb2"; # fg
      render-loading              = true;
      render-loading-bg           = "#282828"; # bg
      render-loading-fg           = "#ebdbb2"; # fg

      /* Recolor book content's color */
      recolor-lightcolor          = "#282828"; # bg
      recolor-darkcolor           = "#ebdbb2"; # fg
      /*recolor-keephue           = true;      */# keep original color
    };
  };
}
