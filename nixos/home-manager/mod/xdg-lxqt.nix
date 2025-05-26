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

        "text/html" = "librewolf.desktop";

        "x-scheme-handler/http" = "librewolf.desktop";
        "x-scheme-handler/https" = "librewolf.desktop";
        "x-scheme-handler/tg" = "org.telegram.desktop.desktop";

        # heroic keeps adding this line
        "x-scheme-handler/heroic" = "com.heroicgameslauncher.hgl.desktop";

        "application/x-gnome-saved-search" = "pcmanfm-qt.desktop";
        "inode/directory" = "pcmanfm-qt.desktop";

        # move this stuff to each desktop's dot nix file
        "image/tiff" = "lximage-qt.desktop";
        "image/jpx" = "lximage-qt.desktop";
        "image/png" = "lximage-qt.desktop";
        "image/gif" = "lximage-qt.desktop";
        "image/jpeg" = "lximage-qt.desktop";
        "image/bmp" = "lximage-qt.desktop";
        "image/jp2" = "lximage-qt.desktop";

        "application/x-tar" = "lxqt-archiver.desktop";
        "application/x-7z-compressed" = "lxqt-archiver.desktop";
        "application/vnd.rar" = "lxqt-archiver.desktop";
        "application/zip" = "lxqt-archiver.desktop";

        "application/pdf" = "org.pwmt.zathura.desktop";
      };
    };
  };
}
