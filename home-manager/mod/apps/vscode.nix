{ pkgs, ... }:
{
  programs.vscode = {
    enable = true;
    extensions = with pkgs.vscode-extensions; [
      vscodevim.vim
      ms-vscode.cpptools
      ms-vscode.makefile-tools
      ms-vscode.cmake-tools
      daohong-emilio.yash
      redhat.java
      redhat.vscode-xml
      redhat.vscode-yaml
      bbenoist.nix
    ];
  };
}
