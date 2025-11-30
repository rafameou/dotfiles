#!/bin/bash

gsettings set org.gnome.desktop.session idle-delay 60

gsettings set org.gnome.mutter dynamic-workspaces true
gsettings set org.gnome.mutter edge-tiling true
gsettings set org.gnome.mutter experimental-features "['scale-monitor-framebuffer', 'xwayland-native-scaling']"

gsettings set org.gnome.shell.keybindings switch-to-application-1 "['<Super><Control>1']"
gsettings set org.gnome.shell.keybindings switch-to-application-2 "['<Super><Control>2']"
gsettings set org.gnome.shell.keybindings switch-to-application-3 "['<Super><Control>3']"
gsettings set org.gnome.shell.keybindings switch-to-application-4 "['<Super><Control>4']"
gsettings set org.gnome.shell.keybindings switch-to-application-5 "['<Super><Control>5']"
gsettings set org.gnome.shell.keybindings switch-to-application-6 "['<Super><Control>6']"
gsettings set org.gnome.shell.keybindings switch-to-application-7 "['<Super><Control>7']"
gsettings set org.gnome.shell.keybindings switch-to-application-8 "['<Super><Control>8']"
gsettings set org.gnome.shell.keybindings switch-to-application-9 "['<Super><Control>9']"

gsettings set org.gnome.desktop.wm.keybindings close "['<Alt>F4', '<Shift><Super>q']"
gsettings set org.gnome.desktop.wm.keybindings switch-to-workspace-1 "['<Super>1', '<Super>Home']"
gsettings set org.gnome.desktop.wm.keybindings switch-to-workspace-2 "['<Super>2']"
gsettings set org.gnome.desktop.wm.keybindings switch-to-workspace-3 "['<Super>3']"
gsettings set org.gnome.desktop.wm.keybindings switch-to-workspace-4 "['<Super>4']"
gsettings set org.gnome.desktop.wm.keybindings switch-to-workspace-5 "['<Super>5']"
gsettings set org.gnome.desktop.wm.keybindings switch-to-workspace-6 "['<Super>6']"
gsettings set org.gnome.desktop.wm.keybindings switch-to-workspace-7 "['<Super>7']"
gsettings set org.gnome.desktop.wm.keybindings switch-to-workspace-8 "['<Super>8']"
gsettings set org.gnome.desktop.wm.keybindings switch-to-workspace-9 "['<Super>9']"
gsettings set org.gnome.desktop.wm.keybindings move-to-workspace-1 "['<Super><Shift>1', '<Super><Shift>Home']"
gsettings set org.gnome.desktop.wm.keybindings move-to-workspace-2 "['<Super><Shift>2']"
gsettings set org.gnome.desktop.wm.keybindings move-to-workspace-3 "['<Super><Shift>3']"
gsettings set org.gnome.desktop.wm.keybindings move-to-workspace-4 "['<Super><Shift>4']"
gsettings set org.gnome.desktop.wm.keybindings move-to-workspace-5 "['<Super><Shift>5']"
gsettings set org.gnome.desktop.wm.keybindings move-to-workspace-6 "['<Super><Shift>6']"
gsettings set org.gnome.desktop.wm.keybindings move-to-workspace-7 "['<Super><Shift>7']"
gsettings set org.gnome.desktop.wm.keybindings move-to-workspace-8 "['<Super><Shift>8']"
gsettings set org.gnome.desktop.wm.keybindings move-to-workspace-9 "['<Super><Shift>9']"

gsettings set org.gnome.shell.window-switcher current-workspace-only true

gsettings set org.gnome.desktop.wm.preferences button-layout "appmenu:close"
gsettings set org.gnome.desktop.wm.preferences titlebar-font "Fira Sans 11"

gsettings set org.gnome.desktop.interface clock-show-date true
gsettings set org.gnome.desktop.interface clock-show-seconds true
gsettings set org.gnome.desktop.interface clock-show-weekday true
gsettings set org.gnome.desktop.interface show-battery-percentage true
gsettings set org.gnome.desktop.interface font-name "Fira Sans 11"
gsettings set org.gnome.desktop.interface document-font-name "Fira Sans 11"
gsettings set org.gnome.desktop.interface monospace-font-name "FiraCode 11"
gsettings set org.gnome.desktop.interface gtk-theme "Adwaita" 
gsettings set org.gnome.desktop.interface color-scheme "prefer-dark"

gsettings set org.gnome.desktop.peripherals.touchpad tap-to-click true

dconf write /org/gtk/settings/file-chooser/sort-directories-first true
dconf write /org/gtk/gtk4/settings/file-chooser/sort-directories-first true

gsettings set org.gnome.shell favorite-apps "['org.qutebrowser.qutebrowser.desktop', 'librewolf.desktop', 'foot.desktop', 'emacs.desktop', 'org.telegram.desktop.desktop', 'org.gnome.Nautilus.desktop', 'gimp.desktop', 'org.nicotine_plus.Nicotine.desktop', 'org.gnome.SystemMonitor.desktop', 'org.gnome.Settings.desktop', 'org.octave.Octave.desktop']"
gsettings set org.gnome.shell disable-user-extensions false
gsettings set org.gnome.shell enabled-extensions "['runcat@kolesnikov.se', 'appindicatorsupport@rgcjonas.gmail.com', 'AlphabeticalAppGrid@stuarthayhurst', 'solaar-extension@sidevesh', 'tailscale-status@maxgallup.github.com', 'dash-to-dock@micxgx.gmail.com']"
gsettings set org.gnome.shell disabled-extensions "[]"

dconf write /org/gnome/shell/extensions/dash-to-dock/apply-custom-theme false
dconf write /org/gnome/shell/extensions/dash-to-dock/background-opacity 0.90000000000000004
dconf write /org/gnome/shell/extensions/dash-to-dock/custom-theme-shrink true
dconf write /org/gnome/shell/extensions/dash-to-dock/dash-max-icon-size 48
dconf write /org/gnome/shell/extensions/dash-to-dock/dock-fixed true
dconf write /org/gnome/shell/extensions/dash-to-dock/dock-position "'LEFT'"
dconf write /org/gnome/shell/extensions/dash-to-dock/extend-height true
dconf write /org/gnome/shell/extensions/dash-to-dock/height-fraction 0.90000000000000002
dconf write /org/gnome/shell/extensions/dash-to-dock/hot-keys false
dconf write /org/gnome/shell/extensions/dash-to-dock/icon-size-fixed true
dconf write /org/gnome/shell/extensions/dash-to-dock/max-alpha 0.90000000000000004
dconf write /org/gnome/shell/extensions/dash-to-dock/running-indicator-style "'DOTS'"
dconf write /org/gnome/shell/extensions/dash-to-dock/show-apps-at-top false
dconf write /org/gnome/shell/extensions/dash-to-dock/show-mounts-network true
dconf write /org/gnome/shell/extensions/dash-to-dock/transparency-mode "'FIXED'"

gsettings set org.gnome.desktop.app-folders folder-children "[]"
