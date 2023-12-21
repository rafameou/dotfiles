{ inputs, lib, config, pkgs, ... }:
{
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
    };
    extraConfig = ''
      import catppuccin
      catppuccin.setup(c, 'frappe', True)
    '';
  };
}
