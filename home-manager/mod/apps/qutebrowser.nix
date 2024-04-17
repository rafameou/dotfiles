{ config, pkgs, ... }:
/*let catpuccin = pkgs.fetchFromGitHub {
owner = "catppuccin";
repo = "qutebrowser";
rev = "78bb72b4c60b421c8ea64dd7c960add6add92f83";
hash = "sha256-lp7HWYuD4aUyX1nRipldEojZVIvQmsxjYATdyHWph0g=";
};
in*/
{
  imports = [ ../nix-colors.nix ];
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
      fonts.default_family = "Fira Sans";
      /*window.transparent = true;*/
      /*----------------------------------|
      |- Stolen from Misterio77's config -|
      |----------------------------------*/
      colors = {
        webpage = {
          preferred_color_scheme = config.colorScheme.variant;
          /*darkmode = {
            enabled = true;
            policy.images = "smart";#"smart-simple";
            policy.page = "smart";
          };*/
          #bg = "#ffffff";
        };
        completion = {
          fg = "#${config.colorScheme.palette.base05}";
          match.fg = "#${config.colorScheme.palette.base09}";
          even.bg = "#${config.colorScheme.palette.base00}";
          odd.bg = "#${config.colorScheme.palette.base00}";
          scrollbar = {
            bg = "#${config.colorScheme.palette.base00}";
            fg = "#${config.colorScheme.palette.base05}";
          };
          category = {
            bg = "#${config.colorScheme.palette.base00}";
            fg = "#${config.colorScheme.palette.base0D}";
            border = {
              bottom = "#${config.colorScheme.palette.base00}";
              top = "#${config.colorScheme.palette.base00}";
            };
          };
          item.selected = {
            bg = "#${config.colorScheme.palette.base02}";
            fg = "#${config.colorScheme.palette.base05}";
            match.fg = "#${config.colorScheme.palette.base05}";
            border = {
              bottom = "#${config.colorScheme.palette.base02}";
              top = "#${config.colorScheme.palette.base02}";
            };
          };
        };
        contextmenu = {
          disabled = {
            bg = "#${config.colorScheme.palette.base01}";
            fg = "#${config.colorScheme.palette.base04}";
          };
          menu = {
            bg = "#${config.colorScheme.palette.base00}";
            fg = "#${config.colorScheme.palette.base05}";
          };
          selected = {
            bg = "#${config.colorScheme.palette.base02}";
            fg = "#${config.colorScheme.palette.base05}";
          };
        };
        downloads = {
          bar.bg = "#${config.colorScheme.palette.base00}";
          error.fg = "#${config.colorScheme.palette.base08}";
          start = {
            bg = "#${config.colorScheme.palette.base0D}";
            fg = "#${config.colorScheme.palette.base00}";
          };
          stop = {
            bg = "#${config.colorScheme.palette.base0C}";
            fg = "#${config.colorScheme.palette.base00}";
          };
        };
        hints = {
          bg = "#${config.colorScheme.palette.base0A}";
          fg = "#${config.colorScheme.palette.base00}";
          match.fg = "#${config.colorScheme.palette.base05}";
        };
        keyhint = {
          bg = "#${config.colorScheme.palette.base00}";
          fg = "#${config.colorScheme.palette.base05}";
          suffix.fg = "#${config.colorScheme.palette.base05}";
        };
        messages = {
          error.bg = "#${config.colorScheme.palette.base08}";
          error.border = "#${config.colorScheme.palette.base08}";
          error.fg = "#${config.colorScheme.palette.base00}";
          info.bg = "#${config.colorScheme.palette.base00}";
          info.border = "#${config.colorScheme.palette.base00}";
          info.fg = "#${config.colorScheme.palette.base05}";
          warning.bg = "#${config.colorScheme.palette.base0E}";
          warning.border = "#${config.colorScheme.palette.base0E}";
          warning.fg = "#${config.colorScheme.palette.base00}";
        };
        prompts = {
          bg = "#${config.colorScheme.palette.base00}";
          fg = "#${config.colorScheme.palette.base05}";
          border = "#${config.colorScheme.palette.base00}";
          selected.bg = "#${config.colorScheme.palette.base02}";
        };
        statusbar = {
          caret.bg = "#${config.colorScheme.palette.base00}";
          caret.fg = "#${config.colorScheme.palette.base0D}";
          caret.selection.bg = "#${config.colorScheme.palette.base00}";
          caret.selection.fg = "#${config.colorScheme.palette.base0D}";
          command.bg = "#${config.colorScheme.palette.base01}";
          command.fg = "#${config.colorScheme.palette.base04}";
          command.private.bg = "#${config.colorScheme.palette.base01}";
          command.private.fg = "#${config.colorScheme.palette.base0E}";
          insert.bg = "#${config.colorScheme.palette.base00}";
          insert.fg = "#${config.colorScheme.palette.base0C}";
          normal.bg = "#${config.colorScheme.palette.base00}";
          normal.fg = "#${config.colorScheme.palette.base05}";
          passthrough.bg = "#${config.colorScheme.palette.base00}";
          passthrough.fg = "#${config.colorScheme.palette.base0A}";
          private.bg = "#${config.colorScheme.palette.base00}";
          private.fg = "#${config.colorScheme.palette.base0E}";
          progress.bg = "#${config.colorScheme.palette.base0D}";
          url.error.fg = "#${config.colorScheme.palette.base08}";
          url.fg = "#${config.colorScheme.palette.base05}";
          url.hover.fg = "#${config.colorScheme.palette.base09}";
          url.success.http.fg = "#${config.colorScheme.palette.base0B}";
          url.success.https.fg = "#${config.colorScheme.palette.base0B}";
          url.warn.fg = "#${config.colorScheme.palette.base0E}";
        };
        tabs = {
          bar.bg = "#${config.colorScheme.palette.base00}";
          even.bg = "#${config.colorScheme.palette.base00}";
          even.fg = "#${config.colorScheme.palette.base05}";
          indicator.error = "#${config.colorScheme.palette.base08}";
          indicator.start = "#${config.colorScheme.palette.base0D}";
          indicator.stop = "#${config.colorScheme.palette.base0C}";
          odd.bg = "#${config.colorScheme.palette.base00}";
          odd.fg = "#${config.colorScheme.palette.base05}";
          pinned.even.bg = "#${config.colorScheme.palette.base0B}";
          pinned.even.fg = "#${config.colorScheme.palette.base00}";
          pinned.odd.bg = "#${config.colorScheme.palette.base0B}";
          pinned.odd.fg = "#${config.colorScheme.palette.base00}";
          pinned.selected.even.bg = "#${config.colorScheme.palette.base02}";
          pinned.selected.even.fg = "#${config.colorScheme.palette.base05}";
          pinned.selected.odd.bg = "#${config.colorScheme.palette.base02}";
          pinned.selected.odd.fg = "#${config.colorScheme.palette.base05}";
          selected.even.bg = "#${config.colorScheme.palette.base02}";
          selected.even.fg = "#${config.colorScheme.palette.base05}";
          selected.odd.bg = "#${config.colorScheme.palette.base02}";
          selected.odd.fg = "#${config.colorScheme.palette.base05}";
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
