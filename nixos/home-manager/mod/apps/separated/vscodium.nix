{ pkgs, ... }:
{
  programs.vscode = {
    enable = true;
    package = pkgs.vscodium;
    profiles.default = {
      extensions = with pkgs.vscode-extensions; [
        vscodevim.vim
        jdinhlife.gruvbox

        jnoortheen.nix-ide

        yzhang.markdown-all-in-one
        davidanson.vscode-markdownlint

        usernamehw.errorlens

        redhat.java
        redhat.vscode-xml
        redhat.vscode-yaml
      ];
    };
  };
}
