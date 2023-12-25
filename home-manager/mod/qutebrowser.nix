{ inputs, lib, config, pkgs, ... }:
let catpuccin = pkgs.fetchFromGitHub {
  owner = "catppuccin";
  repo = "qutebrowser";
  rev = "78bb72b4c60b421c8ea64dd7c960add6add92f83";
  hash = "sha256-lp7HWYuD4aUyX1nRipldEojZVIvQmsxjYATdyHWph0g=";
};
in
  {
    xdg.configFile."qutebrowser/catppuccin".source = catpuccin;
    programs.qutebrowser = {
      enable = true;
      package = (pkgs.qutebrowser.override { enableWideVine = true; });
      loadAutoconfig = true;
      searchEngines = {
        DEFAULT = "https://www.google.com/search?hl=en&q={}";
        w = "https://en.wikipedia.org/wiki/Special:Search?search={}&go=Go&ns0=1";  
        aw = "https://wiki.archlinux.org/?search={}";  
        nw = "https://nixos.wiki/index.php?search={}";  
        g = "https://www.google.com/search?hl=en&q={}";
      };
      settings = {
        url.start_pages = "about:blank";
        tabs.show = "multiple";
        /* tabs.tabs_are_windows = true;*/
        statusbar.show = "in-mode";
        fonts.default_family = "Inter";
      };
      extraConfig = ''
        import catppuccin
        catppuccin.setup(c, 'frappe', True)
      '';
    };
  }
