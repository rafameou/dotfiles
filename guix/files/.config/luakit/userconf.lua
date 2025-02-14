-- settings
local settings = require "settings";
settings.window.home_page = "https://duckduckgo.com";
settings.application.prefer_dark_mode = true;

--

-- search engines
local engines = settings.window.search_engines;
engines.ddg = "https://duckduckgo.com/?q=%s&start=1";
engines.w = "https://en.wikipedia.org/wiki/Special:Search?search=%s&go=Go&ns0=1";  
engines.aw = "https://wiki.archlinux.org/?search=%s";  
engines.nw = "https://nixos.wiki/index.php?search=%s";  
engines.g = "https://www.google.com/search?hl=en&q=%s"; 
engines.default = engines.ddg;
--

-- keybinds
local modes = require "modes";
modes.add_binds("normal", {
-- {"<key>",
--  "<description>",
--  function (w) w:enter_cmd("<command>") end}

  {"<Shift-o>", "Open URL in a new tab.", function (w) w:enter_cmd(":tabopen ") end},
  {"q", "Quit", function (w) w:close_tab() end},
});

-- follow with letters
local select = require "select"
select.label_maker = function (s)
  local chars = s.charset("asdfqwerzxcv")
  return s.trim(s.sort(s.reverse(chars)))
end
