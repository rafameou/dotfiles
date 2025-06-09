{ ... }:
{
  xdg = {
    mimeApps = {
      enable = true;
      associations = {
        added = {
          # gsconnect keeps adding this line, notice the ; :facepalm:
          "x-scheme-handler/sms" = "org.gnome.Shell.Extensions.GSConnect.desktop;";
          "x-scheme-handler/tel" = "org.gnome.Shell.Extensions.GSConnect.desktop;";
          "x-scheme-handler/tg" = "org.telegram.desktop.desktop;";
          "x-scheme-handler/tonsite" = "org.telegram.desktop.desktop;";
          "x-scheme-handler/discord" = "vesktop.desktop;";
        };
      };
      defaultApplications = {
        "video/3gpp" = "mpv.desktop";
        "video/x-ogm+ogg" = "mpv.desktop";
        "video/vnd.mpegurl" = "mpv.desktop";
        "video/x-matroska" = "mpv.desktop";
        "video/ogg" = "mpv.desktop";
        "video/quicktime" = "mpv.desktop";
        "video/3gpp2" = "mpv.desktop";
        "video/webm" = "mpv.desktop";
        "video/vnd.rn-realvideo" = "mpv.desktop";
        "video/mp2t" = "mpv.desktop";
        "video/mp4" = "mpv.desktop";
        "video/x-flv" = "mpv.desktop";
        "video/dv" = "mpv.desktop";
        "video/x-ms-wmv" = "mpv.desktop";
        "video/vnd.avi" = "mpv.desktop";
        "video/mpeg" = "mpv.desktop";
        "video/x-flic" = "mpv.desktop";
        "video/x-theora+ogg" = "mpv.desktop";
        "x-scheme-handler/sgnl" = "signal.desktop";
        "x-scheme-handler/signalcaptcha" = "signal.desktop";

        "text/html" = "librewolf.desktop";

        "x-scheme-handler/http" = "librewolf.desktop";
        "x-scheme-handler/https" = "librewolf.desktop";
        "x-scheme-handler/tg" = "org.telegram.desktop.desktop";
        "x-scheme-handler/tonsite" = "org.telegram.desktop.desktop";

        # heroic keeps adding this line
        "x-scheme-handler/heroic" = "com.heroicgameslauncher.hgl.desktop";
        "x-scheme-handler/discord" = "vesktop.desktop";

        "application/x-gnome-saved-search" = "org.kde.dolphin.desktop";
        "inode/directory" = "org.kde.dolphin.desktop";

        # move this stuff to each desktop's dot nix file
        "image/tiff" = "org.kde.gwenview.desktop";
        "image/jpx" = "org.kde.gwenview.desktop";
        "image/png" = "org.kde.gwenview.desktop";
        "image/gif" = "org.kde.gwenview.desktop";
        "image/jpeg" = "org.kde.gwenview.desktop";
        "image/bmp" = "org.kde.gwenview.desktop";
        "image/jp2" = "org.kde.gwenview.desktop";

        "application/x-tar" = "org.kde.ark.desktop";
        "application/x-7z-compressed" = "org.kde.ark.desktop";
        "application/vnd.rar" = "org.kde.ark.desktop";
        "application/zip" = "org.kde.ark.desktop";

        "application/pdf" = "org.kde.okular.desktop";
      };
    };
  };
}
