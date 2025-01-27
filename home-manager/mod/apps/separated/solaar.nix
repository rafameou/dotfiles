{ ... }:
{
  xdg.configFile = {
    "solaar/rules.yaml".text = ''
      %YAML 1.3
      ---
      - Key: [Emoji Smiley Heart Eyes, pressed]
      - KeyPress:
      - KP_Home
      - click
      ...
      ---
      - Key: [Emoji Crying Face, pressed]
      - KeyPress:
      - KP_Page_Up
      - click
      ...
      ---
      - Key: [Emoji Smiley, pressed]
      - KeyPress:
      - KP_Page_Down
      - click
      ...
      ---
      - Key: [Emoji Smilie With Tears, pressed]
      - KeyPress:
      - KP_End
      - click
      ...
      ---
      - Key: [Open Emoji Panel, pressed]
      - KeyPress:
      - backslash
      - click
      ...
      ---
      - Key: [Voice Dictation, pressed]
      - KeyPress:
      - backslash
      - click
      ...
    '';
  };
}
