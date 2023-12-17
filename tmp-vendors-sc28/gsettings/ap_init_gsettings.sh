export AP_VENDORS_GSETTINGS_SETUP_DIR="${AP_SCRIPTO_COMMON_DIR}/vendors/gsettings"
alias viscgsettings='vi "${AP_VENDORS_GSETTINGS_SETUP_DIR}/ap_init_gsettings.sh"'
alias gsettingsfind='gsettings list-recursively | grep'

# Mutter
# gsettings set org.gnome.mutter overlay-key ''
gsettings set org.gnome.mutter overlay-key 'Super_R'

gsettings set org.gnome.mutter.keybindings toggle-tiled-left "['<Ctrl><Super><Shift>Left']"
gsettings set org.gnome.mutter.keybindings toggle-tiled-right "['<Ctrl><Super><Shift>Right']"

gsettings set org.gnome.mutter.wayland.keybindings restore-shortcuts "['']"
gsettings set org.gnome.mutter.keybindings switch-monitor "['']"
gsettings set org.gnome.mutter center-new-windows true

# Desktop
gsettings set org.gnome.desktop.peripherals.mouse natural-scroll true
# gsettings set org.gnome.desktop.input-sources xkb-options "['altwin:swap_lalt_lwin']"
gsettings set org.gnome.desktop.input-sources show-all-sources true
gsettings set org.gnome.desktop.interface clock-show-weekday true
gsettings set org.gnome.desktop.interface clock-show-date true

# Windows Manager
gsettings set org.gnome.desktop.wm.preferences action-middle-click-titlebar 'toggle-maximize-vertically'
gsettings set org.gnome.desktop.wm.keybindings maximize "['<Ctrl><Super><Shift>Up']"
gsettings set org.gnome.desktop.wm.keybindings unmaximize "['<Ctrl><Super><Shift>Down']"
gsettings set org.gnome.desktop.wm.keybindings minimize "[]"

gsettings set org.gnome.desktop.wm.keybindings switch-input-source "['<Super><Shift>Space']"
gsettings set org.gnome.desktop.wm.keybindings switch-input-source-backward "['']"

gsettings set org.gnome.desktop.wm.keybindings switch-to-workspace-left "['<Super><Alt>Left']"
gsettings set org.gnome.desktop.wm.keybindings switch-to-workspace-right "['<Super><Alt>Right']"
gsettings set org.gnome.desktop.wm.keybindings move-to-workspace-left "['']"
# gsettings set org.gnome.desktop.wm.keybindings move-to-workspace-left "['<Super><Shift>Left']"
gsettings set org.gnome.desktop.wm.keybindings move-to-workspace-right "['']"
# gsettings set org.gnome.desktop.wm.keybindings move-to-workspace-right "['<Super><Shift>Right']"
gsettings set org.gnome.desktop.wm.keybindings move-to-workspace-1 "['']"
gsettings set org.gnome.desktop.wm.keybindings switch-to-workspace-1 "['']"
gsettings set org.gnome.desktop.wm.keybindings move-to-workspace-last "['']"
gsettings set org.gnome.desktop.wm.keybindings switch-to-workspace-last "['']"

gsettings set org.gnome.desktop.wm.keybindings move-to-monitor-left "['']"
gsettings set org.gnome.desktop.wm.keybindings move-to-monitor-right "['']"

# gsettings set org.gnome.desktop.wm.keybindings cycle-windows "['<Alt>Escape']"

gsettings set org.gnome.desktop.wm.keybindings begin-move "['<Super>F7']" # move windows
# gsettings set org.gnome.desktop.wm.keybindings close "['<Super>F4']"
gsettings set org.gnome.desktop.wm.keybindings close "['<Super>q']"
gsettings set org.gnome.desktop.wm.keybindings show-desktop "['']"

# Plugins | Media keys
gsettings set org.gnome.settings-daemon.plugins.media-keys custom-keybindings "[]"
# gsettings set org.gnome.settings-daemon.plugins.media-keys custom-keybindings "['/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/', '/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom1/', '/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom2/']"

## Joplin
# gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/ name "Launch Joplin Desktop"
# gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/ command ~/.joplin/Joplin.AppImage
# gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/ binding "<Alt><Shift>1"

# Terminal
# ap_gsettings_schema=org.gnome.Terminal.Legacy.Keybindings
# ap_gsettings_path=/org/gnome/terminal/legacy/keybindings/
# ap_gsettings_schema_path="${ap_gsettings_schema}:${ap_gsettings_path}"

# gsettings set "${ap_gsettings_schema_path}" copy "['<Super>c']"
# gsettings set "${ap_gsettings_schema_path}" paste "['<Super>v']"
# gsettings set "${ap_gsettings_schema_path}" switch-to-tab-1 'disabled'

# Gnome shell - Keybindings
gsettings set org.gnome.shell.keybindings toggle-overview "['']"
gsettings set org.gnome.shell.keybindings toggle-message-tray "['<Super>i']"
gsettings set org.gnome.shell.keybindings toggle-application-view "['<Super>space']"
gsettings set org.gnome.shell.keybindings focus-active-notification "['']"

gsettings set org.gnome.shell.keybindings switch-to-application-1 "['']"
gsettings set org.gnome.shell.keybindings switch-to-application-2 "['']"
gsettings set org.gnome.shell.keybindings switch-to-application-3 "['']"
gsettings set org.gnome.shell.keybindings switch-to-application-4 "['']"
gsettings set org.gnome.shell.keybindings switch-to-application-5 "['']"
gsettings set org.gnome.shell.keybindings switch-to-application-6 "['']"
gsettings set org.gnome.shell.keybindings switch-to-application-7 "['']"
gsettings set org.gnome.shell.keybindings switch-to-application-8 "['']"
gsettings set org.gnome.shell.keybindings switch-to-application-9 "['']"

# Gnome shell - Keybindings - Screenshots
gsettings set org.gnome.shell.keybindings screenshot "['']"
gsettings set org.gnome.shell.keybindings screenshot-window "['']"
# gsettings set org.gnome.shell.keybindings screenshot-window "['<Super><Shift>3']"
gsettings set org.gnome.shell.keybindings show-screen-recording-ui "['']"
gsettings set org.gnome.shell.keybindings show-screenshot-ui "['<Super><Shift>1']"

# Gnome shell - Extensions - Dash & Dock
gsettings set org.gnome.shell.extensions.dash-to-dock app-hotkey-1 "['']"
gsettings set org.gnome.shell.extensions.dash-to-dock app-hotkey-2 "['']"
gsettings set org.gnome.shell.extensions.dash-to-dock app-hotkey-3 "['']"
gsettings set org.gnome.shell.extensions.dash-to-dock app-hotkey-4 "['']"
gsettings set org.gnome.shell.extensions.dash-to-dock app-hotkey-5 "['']"
gsettings set org.gnome.shell.extensions.dash-to-dock app-hotkey-6 "['']"
gsettings set org.gnome.shell.extensions.dash-to-dock app-hotkey-7 "['']"
gsettings set org.gnome.shell.extensions.dash-to-dock app-hotkey-8 "['']"
gsettings set org.gnome.shell.extensions.dash-to-dock app-hotkey-9 "['']"
gsettings set org.gnome.shell.extensions.dash-to-dock app-hotkey-10 "['']"

gsettings set org.gnome.shell.extensions.dash-to-dock app-shift-hotkey-1 "['']"
gsettings set org.gnome.shell.extensions.dash-to-dock app-shift-hotkey-2 "['']"
gsettings set org.gnome.shell.extensions.dash-to-dock app-shift-hotkey-3 "['']"
gsettings set org.gnome.shell.extensions.dash-to-dock app-shift-hotkey-4 "['']"
gsettings set org.gnome.shell.extensions.dash-to-dock app-shift-hotkey-5 "['']"
gsettings set org.gnome.shell.extensions.dash-to-dock app-shift-hotkey-6 "['']"
gsettings set org.gnome.shell.extensions.dash-to-dock app-shift-hotkey-7 "['']"
gsettings set org.gnome.shell.extensions.dash-to-dock app-shift-hotkey-8 "['']"
gsettings set org.gnome.shell.extensions.dash-to-dock app-shift-hotkey-9 "['']"
gsettings set org.gnome.shell.extensions.dash-to-dock app-shift-hotkey-10 "['']"

gsettings set org.gnome.shell.extensions.dash-to-dock app-ctrl-hotkey-1 "['']"
gsettings set org.gnome.shell.extensions.dash-to-dock app-ctrl-hotkey-2 "['']"
gsettings set org.gnome.shell.extensions.dash-to-dock app-ctrl-hotkey-3 "['']"
gsettings set org.gnome.shell.extensions.dash-to-dock app-ctrl-hotkey-4 "['']"
gsettings set org.gnome.shell.extensions.dash-to-dock app-ctrl-hotkey-5 "['']"
gsettings set org.gnome.shell.extensions.dash-to-dock app-ctrl-hotkey-6 "['']"
gsettings set org.gnome.shell.extensions.dash-to-dock app-ctrl-hotkey-7 "['']"
gsettings set org.gnome.shell.extensions.dash-to-dock app-ctrl-hotkey-8 "['']"
gsettings set org.gnome.shell.extensions.dash-to-dock app-ctrl-hotkey-9 "['']"
gsettings set org.gnome.shell.extensions.dash-to-dock app-ctrl-hotkey-10 "['']"

gsettings set org.gnome.shell.extensions.dash-to-dock click-action 'focus-or-previews'
gsettings set org.gnome.shell.extensions.dash-to-dock shift-click-action 'launch'
gsettings set org.gnome.shell.extensions.dash-to-dock middle-click-action 'launch'
gsettings set org.gnome.shell.extensions.dash-to-dock shift-middle-click-action 'minimize'
gsettings set org.gnome.shell.extensions.dash-to-dock scroll-action 'switch-workspace'
gsettings set org.gnome.shell.extensions.dash-to-dock scroll-switch-workspace true
gsettings set org.gnome.shell.extensions.dash-to-dock scroll-to-focused-application true

gsettings set org.gnome.shell.extensions.dash-to-dock autohide false
gsettings set org.gnome.shell.extensions.dash-to-dock autohide-in-fullscreen false
gsettings set org.gnome.shell.extensions.dash-to-dock icon-size-fixed true
gsettings set org.gnome.shell.extensions.dash-to-dock dash-max-icon-size 32
gsettings set org.gnome.shell.extensions.dash-to-dock dock-fixed true
gsettings set org.gnome.shell.extensions.dash-to-dock dock-position 'BOTTOM'
gsettings set org.gnome.shell.extensions.dash-to-dock extend-height true
gsettings set org.gnome.shell.extensions.dash-to-dock activate-single-window true
gsettings set org.gnome.shell.extensions.dash-to-dock animate-show-apps true
gsettings set org.gnome.shell.extensions.dash-to-dock disable-overview-on-startup true
gsettings set org.gnome.shell.extensions.dash-to-dock force-straight-corner false

gsettings set org.gnome.shell.extensions.dash-to-dock show-apps-at-top false
gsettings set org.gnome.shell.extensions.dash-to-dock show-favorites true
gsettings set org.gnome.shell.extensions.dash-to-dock show-mounts-network true
gsettings set org.gnome.shell.extensions.dash-to-dock show-mounts-only-mounted true
gsettings set org.gnome.shell.extensions.dash-to-dock show-running true
gsettings set org.gnome.shell.extensions.dash-to-dock show-show-apps-button true
gsettings set org.gnome.shell.extensions.dash-to-dock show-trash true
gsettings set org.gnome.shell.extensions.dash-to-dock show-windows-preview true
gsettings set org.gnome.shell.extensions.dash-to-dock show-delay 0.25 # default: 0.25
gsettings set org.gnome.shell.extensions.dash-to-dock show-mounts false

gsettings set org.gnome.shell.extensions.dash-to-dock hot-keys true
gsettings set org.gnome.shell.extensions.dash-to-dock hotkeys-overlay true
gsettings set org.gnome.shell.extensions.dash-to-dock hotkeys-show-dock true
# gsettings set org.gnome.shell.extensions.dash-to-dock shortcut "['<Super>z']"
gsettings set org.gnome.shell.extensions.dash-to-dock shortcut "['']"
# gsettings set org.gnome.shell.extensions.dash-to-dock shortcut-text '<Super>z'
gsettings set org.gnome.shell.extensions.dash-to-dock shortcut-text ''
gsettings set org.gnome.shell.extensions.dash-to-dock shortcut-timeout 2.0

# gsettings set org.gnome.shell.extensions.dash-to-dock click-action 'minimize'
# gsettings set org.gnome.shell.extensions.dash-to-dock click-action 'focus-or-previews'
# gsettings set org.gnome.shell.extensions.dash-to-dock middle-click-action 'launch'
# gsettings set org.gnome.shell.extensions.dash-to-dock shift-click-action 'launch'
# gsettings set org.gnome.shell.extensions.dash-to-dock shift-middle-click-action 'minimize'

# Disable screen reader shortcut keys
gsettings set org.gnome.settings-daemon.plugins.media-keys screenreader "['']"
