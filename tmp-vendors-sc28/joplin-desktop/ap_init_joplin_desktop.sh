# https://joplinapp.org/help/#desktop-applications

export AP_VENDORS_JOPLIN_DESKTOP_SETUP_DIR="${AP_SCRIPTO_COMMON_DIR}/vendors/joplin-desktop"
export AP_VENDORS_JOPLIN_DESKTOP_SETUP_CONFIGS_DIR="${AP_VENDORS_JOPLIN_DESKTOP_SETUP_DIR}/configs"
export AP_VENDORS_JOPLIN_DESKTOP_SETUP_PLUGINS_DIR="${AP_VENDORS_JOPLIN_DESKTOP_SETUP_DIR}/plugins"

alias zjldesktopconfigs='cd ~/.config/joplin-desktop'
alias zscjldesktopconfigs="cd ${AP_VENDORS_JOPLIN_DESKTOP_SETUP_CONFIGS_DIR}"

# ln -sf "${AP_VENDORS_JOPLIN_DESKTOP_SETUP_CONFIGS_DIR}/ap_settings.json" ~/.config/joplin-desktop/settings.json

if [[ ! -L ~/.config/joplin-desktop/plugins ]]; then
  ln -sf "${AP_VENDORS_JOPLIN_DESKTOP_SETUP_PLUGINS_DIR}" ~/.config/joplin-desktop/plugins
fi

if [[ "${AP_OS_TYPE}" == "${AP_OS_TYPE_MACOS}" ]]; then
  alias jldesktopstartdevmode='/Applications/Joplin.app/Contents/MacOS/Joplin --env dev'
  alias bkjldesktopkeymap='cp -f ~/.config/joplin-desktop/keymap-desktop.json "${AP_VENDORS_JOPLIN_DESKTOP_SETUP_CONFIGS_DIR}/ap_keymap_macos.json"'
  alias rtjldesktopkeymap='cp -f "${AP_VENDORS_JOPLIN_DESKTOP_SETUP_CONFIGS_DIR}/ap_keymap_macos.json" ~/.config/joplin-desktop/keymap-desktop.json'
  alias bkjldesktopsettings='cp -f ~/.config/joplin-desktop/settings.json "${AP_VENDORS_JOPLIN_DESKTOP_SETUP_CONFIGS_DIR}/ap_settings_macos.json"'
  alias rtjldesktopsettings='cp -f "${AP_VENDORS_JOPLIN_DESKTOP_SETUP_CONFIGS_DIR}/ap_settings_macos.json" ~/.config/joplin-desktop/settings.json'

  alias viscjldesktop="vi -p \
		${AP_VENDORS_JOPLIN_DESKTOP_SETUP_DIR}/ap_init_joplin_desktop.sh \
		${AP_VENDORS_JOPLIN_DESKTOP_SETUP_CONFIGS_DIR}/ap_settings_macos.json \
		${AP_VENDORS_JOPLIN_DESKTOP_SETUP_CONFIGS_DIR}/ap_keymap_macos.json"
elif [[ "${AP_OS_TYPE}" == "${AP_OS_TYPE_UBUNTU}" ]]; then
  alias jldesktopstartdevmode='/tmp/.mount_Joplina8xwOE/@joplinapp-desktop --env dev'
  alias bkjldesktopkeymap='cp -f ~/.config/joplin-desktop/keymap-desktop.json "${AP_VENDORS_JOPLIN_DESKTOP_SETUP_CONFIGS_DIR}/ap_keymap_linux.json"'
  alias rtjldesktopkeymap='cp -f "${AP_VENDORS_JOPLIN_DESKTOP_SETUP_CONFIGS_DIR}/ap_keymap_linux.json" ~/.config/joplin-desktop/keymap-desktop.json'
  alias bkjldesktopsettings='cp -f ~/.config/joplin-desktop/settings.json "${AP_VENDORS_JOPLIN_DESKTOP_SETUP_CONFIGS_DIR}/ap_settings_linux.json"'
  alias rtjldesktopsettings='cp -f "${AP_VENDORS_JOPLIN_DESKTOP_SETUP_CONFIGS_DIR}/ap_settings_linux.json" ~/.config/joplin-desktop/settings.json'

  alias viscjldesktop="vi -p \
		${AP_VENDORS_JOPLIN_DESKTOP_SETUP_DIR}/ap_init_joplin_desktop.sh \
		${AP_VENDORS_JOPLIN_DESKTOP_SETUP_CONFIGS_DIR}/ap_settings_linux.json \
		${AP_VENDORS_JOPLIN_DESKTOP_SETUP_CONFIGS_DIR}/ap_keymap_linux.json"
fi
