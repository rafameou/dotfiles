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
          #"x-scheme-handler/sms" = "org.gnome.Shell.Extensions.GSConnect.desktop;";
          #"x-scheme-handler/tel" = "org.gnome.Shell.Extensions.GSConnect.desktop;";
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

        "text/html" = "floorp.desktop";

        "x-scheme-handler/http" = "floorp.desktop";
        "x-scheme-handler/https" = "floorp.desktop";
        "x-scheme-handler/tg" = "org.telegram.desktop.desktop";

        /* heroic keeps adding this line */
        "x-scheme-handler/heroic" = "com.heroicgameslauncher.hgl.desktop";

        "inode/directory" = "caja.desktop";

        # move this stuff to each desktop's dot nix file
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

        #its random, thanks thunderbid
        /*"x-scheme-handler/mailto"="userapp-Betterbird-NUOGP2.desktop";
        "x-scheme-handler/mid"="userapp-Betterbird-NUOGP2.desktop";
        "x-scheme-handler/news"="userapp-Betterbird-N81HP2.desktop";
        "x-scheme-handler/snews"="userapp-Betterbird-N81HP2.desktop";
        "x-scheme-handler/nntp"="userapp-Betterbird-N81HP2.desktop";
        "x-scheme-handler/feed"="userapp-Betterbird-6GWGP2.desktop";
        "application/rss+xml"="userapp-Betterbird-6GWGP2.desktop";
        "application/x-extension-rss"="userapp-Betterbird-6GWGP2.desktop;";
        "x-scheme-handler/webcal"="userapp-Betterbird-7KB8O2.desktop;";
        "x-scheme-handler/webcals"="userapp-Betterbird-7KB8O2.desktop;";
        "application/x-extension-ics"="userapp-Betterbird-7KB8O2.desktop";
        "message/rfc822"="userapp-Betterbird-NUOGP2.desktop";
        "text/calendar"="userapp-Betterbird-7KB8O2.desktop";*/
      };
    };
  };
}
