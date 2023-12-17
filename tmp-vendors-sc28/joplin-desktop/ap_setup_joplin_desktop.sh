# https://joplinapp.org/help/#desktop-applications

export AP_VENDORS_JOPLIN_DESKTOP_SETUP_DIR="${AP_SCRIPTO_COMMON_DIR}/vendors/joplin-desktop"
export AP_VENDORS_JOPLIN_DESKTOP_SETUP_CONFIGS_DIR="${AP_VENDORS_JOPLIN_DESKTOP_SETUP_DIR}/configs"
export AP_VENDORS_JOPLIN_DESKTOP_SETUP_PLUGINS_DIR="${AP_VENDORS_JOPLIN_DESKTOP_SETUP_DIR}/plugins"

if [[ "${AP_OS_TYPE}" == "${AP_OS_TYPE_MACOS}" ]]; then
	if ! brew list --cask --versions | grep joplin &>/dev/null; then
		@logshow "Installing [joplin desktop] using [brew]\n"
		brew install --cask joplin

		if brew list --cask --versions | grep joplin &>/dev/null; then
			@logshow "Installed [joplin desktop] successfully using [brew]\n"
		else
			@logshow "Installed [joplin desktop] unsuccessfully using [brew]\n"
		fi
	fi
elif [[ "${AP_OS_TYPE}" == "${AP_OS_TYPE_UBUNTU}" ]]; then
	if [[ -n "${XDG_CURRENT_DESKTOP:-}" ]]; then
		@logshow "Installing [joplin desktop]\n"
		wget -O - https://raw.githubusercontent.com/laurent22/joplin/dev/Joplin_install_and_update.sh | bash

		if [[ -x ~/.joplin/Joplin.AppImage ]]; then
			@logshow "Installed [joplin desktop] successfully\n"
		else
			@logshow "Installed [joplin desktop] unsuccessfully\n"
		fi
	fi
fi
