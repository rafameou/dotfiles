{ inputs, lib, config, pkgs, ... }:
{
  xdg = {
    desktopEntries = {
      whatsapp = {
        name = "WhatsApp";
        exec = "qutebrowser web.whatsapp.com";
      };
      mastodon = {
        name = "Mastodon";
        exec = "qutebrowser mastodon.social";
      };
      duolingo = {
        name = "Duolingo";
        exec = "qutebrowser preview.duolingo.com";
      };
      discord = {
        name = "Discord";
        exec = "vesktop";
      };
    };
    mimeApps = {
      enable = true;
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

        "text/html" = "org.qutebrowser.qutebrowser.desktop";

        "x-scheme-handler/http" = "org.qutebrowser.qutebrowser.desktop";
        "x-scheme-handler/https" = "org.qutebrowser.qutebrowser.desktop";

        "inode/directory" = "pcmanfm-qt.desktop";

        "image/tiff" = "vimiv.desktop";
        "image/jpx" = "vimiv.desktop";
        "image/png" = "vimiv.desktop";
        "image/gif" = "vimiv.desktop";
        "image/jpeg" = "vimiv.desktop";
        "image/bmp" = "vimiv.desktop";
        "image/jp2" = "vimiv.desktop";

        "application/x-tar" = "org.kde.ark.desktop";
        "application/x-7z-compressed" = "org.kde.ark.desktop";
        "application/vnd.rar" = "org.kde.ark.desktop"; 
        "application/zip" = "org.kde.ark.desktop";

        "application/pdf" = "org.pwmt.zathura.desktop";
      };
    };
  };
}
