{ inputs, lib, config, pkgs, ... }:
{
  programs.qutebrowser = {
    enable = true;
    package = (qutebrowser.override { enableWideVine = true; });
    searchEngines = {
      DEFAULT = "https://www.google.com/search?hl=en&q={}";
      w = "https://en.wikipedia.org/wiki/Special:Search?search={}&go=Go&ns0=1";  
      aw = "https://wiki.archlinux.org/?search={}";  
      nw = "https://nixos.wiki/index.php?search={}";  
      g = "https://www.google.com/search?hl=en&q={}";
    };
    settings = ''
      import catppuccin

      # load your autoconfig, use this, if the rest of your config is empty!
      config.load_autoconfig()

      # set the flavor you'd like to use
      # valid options are 'mocha', 'macchiato', 'frappe', and 'latte'
      # last argument (optional, default is False): enable the plain look for the menu rows
      catppuccin.setup(c, 'frappe', True)
    '';
  };
}
