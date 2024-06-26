{ config, pkgs, ... }:
/*let catpuccin = pkgs.fetchFromGitHub {
owner = "catppuccin";
repo = "qutebrowser";
rev = "78bb72b4c60b421c8ea64dd7c960add6add92f83";
hash = "sha256-lp7HWYuD4aUyX1nRipldEojZVIvQmsxjYATdyHWph0g=";
};
in*/
{
  /*xdg.configFile."qutebrowser/catppuccin".source = catpuccin;*/
  programs.qutebrowser = {
    enable = true;
    package = (pkgs.qutebrowser.override { enableWideVine = true; });
    loadAutoconfig = true;
    searchEngines = {
      DEFAULT = "https://duckduckgo.com/?q={}&start=1";
      w = "https://en.wikipedia.org/wiki/Special:Search?search={}&go=Go&ns0=1";  
      aw = "https://wiki.archlinux.org/?search={}";  
      nw = "https://nixos.wiki/index.php?search={}";  
      g = "https://www.google.com/search?hl=en&q={}";
    };
    settings = {
      url.start_pages = "https://start.duckduckgo.com/";
      tabs.show = "multiple";
      tabs.tabs_are_windows = true;
      statusbar.show = "in-mode";
      /*window.transparent = true;*/
      /*----------------------------------|
      |- Stolen from Misterio77's config -|
      |----------------------------------*/
      colors = {
        webpage = {
          /*darkmode = {
            enabled = true;
            policy.images = "smart";#"smart-simple";
            policy.page = "smart";
          };*/
          #bg = "#ffffff";
        };
      };
    };
    keyBindings = {
      normal = {
        "q" = "tab-close";
        "d" = "spawn mpv {url}";
      };
    };
  };
}
