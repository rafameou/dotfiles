{ ... }:
{
  xdg = {
    mimeApps = {
      enable = true;
      associations = {
        added = {
          /*gsconnect keeps adding this line, notice the ; :facepalm:*/
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

        "text/html" = "firefox.desktop";

        "x-scheme-handler/http" = "firefox.desktop";
        "x-scheme-handler/https" = "firefox.desktop";
        "x-scheme-handler/tg" = "org.telegram.desktop.desktop";

        /* heroic keeps adding this line */
        "x-scheme-handler/heroic" = "com.heroicgameslauncher.hgl.desktop";

        "application/x-gnome-saved-search" = "org.gnome.Nautilus.desktop";
        "inode/directory" = "org.gnome.Nautilus.desktop";

        # move this stuff to each desktop's dot nix file
        "image/tiff" = "org.gnome.Loupe.desktop";
        "image/jpx" = "org.gnome.Loupe.desktop";
        "image/png" = "org.gnome.Loupe.desktop";
        "image/gif" = "org.gnome.Loupe.desktop";
        "image/jpeg" = "org.gnome.Loupe.desktop";
        "image/bmp" = "org.gnome.Loupe.desktop";
        "image/jp2" = "org.gnome.Loupe.desktop";

        "application/x-tar" = "org.gnome.FileRoller.desktop";
        "application/x-7z-compressed" = "org.gnome.FileRoller.desktop";
        "application/vnd.rar" = "org.gnome.FileRoller.desktop"; 
        "application/zip" = "org.gnome.FileRoller.desktop";

        "application/pdf" = "org.pwmt.zathura.desktop";
      };
    };
  };
}
