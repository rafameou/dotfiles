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
    kdePackages.qtwayland
  ];

  qt = {
    enable = true;
    #platformTheme = "gnome";
    #style.name = "adwaita";
  };

  dconf.settings = {
    "org/gnome/shell" = {
      /*favorite-apps = [
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
      ];*/
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
      /*https://github.com/BenJetson/gnome-dash-fix*/
      folder-children = ["accessories" "chrome-apps" "games" "graphics" "internet" "office" "programming" "science" "sound---video" "system-tools" "universal-access" "wine"];
    };
    "org/gnome/desktop/app-folders/folders/accessories" = {
      name = "Accessories";
      categories = ["Utility"];
    };
    "org/gnome/desktop/app-folders/folders/chrome-apps" = {
      name = "Chrome Apps";
      categories = ["chrome-apps"];
    };
    "org/gnome/desktop/app-folders/folders/games" = {
      name = "Games";
      categories = ["Game"];
    };
    "org/gnome/desktop/app-folders/folders/graphics" = {
      name = "Graphics";
      categories = ["Graphics"];
    };
    "org/gnome/desktop/app-folders/folders/internet" = {
      name = "Internet";
      categories = ["Network" "WebBrowser" "Email"];
    };
    "org/gnome/desktop/app-folders/folders/office" = {
      name = "Office";
      categories = ["Office"];
    };
    "org/gnome/desktop/app-folders/folders/programming" = {
      name = "Programming";
      categories = ["Development"];
    };
    "org/gnome/desktop/app-folders/folders/science" = {
      name = "Science";
      categories = ["Science"];
    };
    "org/gnome/desktop/app-folders/folders/sound---video" = {
      name = "Sound & Video";
      categories = ["AudioVideo" "Audio" "Video"];
    };
    "org/gnome/desktop/app-folders/folders/system-tools" = {
      name = "System Tools";
      categories = ["System" "Settings"];
    };
    "org/gnome/desktop/app-folders/folders/universal-access" = {
      name = "Universal Access";
      categories = ["Accessibility"];
    };
    "org/gnome/desktop/app-folders/folders/wine" = {
      name = "Wine";
      categories = ["Wine" "X-Wine" "Wine-Programs-Accessories"];
    };
    "org/gnome/desktop/wm/preferences" = {
      button-layout = "appmenu:minimize,maximize,close";
      titlebar-font = "Fira Sans 11";
    };
    "org/gnome/desktop/interface" = {
      clock-show-seconds = true;
      show-battery-percentage = true;
      font-name = "Fira Sans 11";
      document-font-name = "Fira Sans 11";
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
