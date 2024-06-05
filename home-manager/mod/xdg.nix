{ ... }:
{
  xdg = {
    /*desktopEntries = {
      whatsapp = {
        name = "WhatsApp";
        categories = [ "Network" "InstantMessaging" "Chat"];
        exec = "qutebrowser web.whatsapp.com";
      };
      mastodon = {
        name = "Mastodon";
        categories = [ "Network" ];
        exec = "qutebrowser mastodon.social";
      };
      duolingo = {
        name = "Duolingo";
        categories = [ "Network" ];
        exec = "qutebrowser preview.duolingo.com";
      };
      clematis = {
        name = "Clematis";
        exec = "clematis";
      };
    };*/
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

        "text/html" = "vivaldi-stable.desktop";

        "x-scheme-handler/http" = "vivaldi-stable.desktop";
        "x-scheme-handler/https" = "vivaldi-stable.desktop";
        "x-scheme-handler/tg" = "org.telegram.desktop.desktop";

        /* heroic keeps adding this line */
        "x-scheme-handler/heroic" = "com.heroicgameslauncher.hgl.desktop";

        "inode/directory" = "caja.desktop";

        "image/tiff" = "eom.desktop";
        "image/jpx" = "eom.desktop";
        "image/png" = "eom.desktop";
        "image/gif" = "eom.desktop";
        "image/jpeg" = "eom.desktop";
        "image/bmp" = "eom.desktop";
        "image/jp2" = "eom.desktop";

        "application/x-tar" = "engrampa.desktop";
        "application/x-7z-compressed" = "engrampa.desktop";
        "application/vnd.rar" = "engrampa.desktop"; 
        "application/zip" = "engrampa.desktop";

        "application/pdf" = "org.pwmt.zathura.desktop";
      };
    };
  };
}
