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
    };
  };
}
