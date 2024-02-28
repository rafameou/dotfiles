{ pkgs, ... }:
{
  home.packages = with pkgs; [
    gnome.gnome-software
    gnome.gnome-tweaks
    gnome.dconf-editor
    gnome-builder
    # ---- gnome extensions ----
    gnomeExtensions.runcat
    gnomeExtensions.appindicator
    gnomeExtensions.openweather
    gnomeExtensions.alphabetical-app-grid
    gnomeExtensions.favourites-in-appgrid
    gnomeExtensions.todotxt
    gnomeExtensions.hot-edge
    gnomeExtensions.caffeine
    gnomeExtensions.activate_gnome
    # ---- gnome fixes ----
    adwaita-qt
    adwaita-qt6
    libsForQt5.qt5.qtwayland
    qt6.qtwayland
  ];

  qt = {
    enable = true;
    #platformTheme = "gnome";
    #style.name = "adwaita";
  };

  dconf.settings = {
    "org/gnome/shell" = {
      favorite-apps = [
        "vivaldi-stable.desktop"
        "google-chrome.desktop"
        "thunderbird.desktop"
        "org.gnome.Nautilus.desktop"
        "cherrytree.desktop"
        "org.telegram.desktop.desktop"
        "discord.desktop"
        "vivaldi-hnpfjngllnobngcgfapefoaidbinmjnm-Default.desktop" #whatsapp
        "vivaldi-akpamiohjfcnimfljfndmaldlcfphjmp-Default.desktop" #instagram
        "vivaldi-jneocipojkkahfcibhjaiilegofacenn-Default.desktop" #duolingo
        "spotify.desktop"
        "bitwarden.desktop"
        "org.gnome.Console.desktop"
        "gnome-system-monitor.desktop"
        "github-desktop.desktop"
      ];
      disable-user-extensions = false;
      enabled-extensions = [
        "runcat@kolesnikov.se"
        "appindicatorsupport@rgcjonas.gmail.com"
        "openweather-extension@jenslody.de"
	"AlphabeticalAppGrid@stuarthayhurst"
	"favourites-in-appgrid@harshadgavali.gitlab.org"
	"todo.txt@bart.libert.gmail.com"
	"hotedge@jonathan.jdoda.ca"
	"caffeine@patapon.info"
      ];
    };
    "org/gnome/desktop/app-folders" = {
      folder-children = []; #pior implementacao de pasta 2011-2023
    };
    "org/gnome/desktop/wm/preferences" = {
      button-layout = "appmenu:minimize,maximize,close";
      titlebar-font = "Inter Medium 11";
    };
    "org/gnome/desktop/interface" = {
      clock-show-seconds = true;
      show-battery-percentage = true;
      font-name = "Inter 11";
      document-font-name = "Inter 11";
    };
    "org/gnome/desktop/peripherals/touchpad" = {
      tap-to-click = true;
    };
    "org/gtk/settings/file-chooser" = {
      sort-directories-first = true;
    };
    "org/gtk/gtk4/settings/file-chooser" = {
      sort-directories-first = true;
    };
  };
}
