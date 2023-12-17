# https://joplinapp.org/help/#desktop-applications

export AP_VENDORS_JOPLIN_DESKTOP_SETUP_DIR="${AP_SCRIPTO_COMMON_DIR}/vendors/joplin-desktop"
export AP_VENDORS_JOPLIN_DESKTOP_SETUP_CONFIGS_DIR="${AP_VENDORS_JOPLIN_DESKTOP_SETUP_DIR}/configs"
export AP_VENDORS_JOPLIN_DESKTOP_SETUP_PLUGINS_DIR="${AP_VENDORS_JOPLIN_DESKTOP_SETUP_DIR}/plugins"

if [[ "${AP_OS_TYPE}" == "${AP_OS_TYPE_MACOS}" ]]; then
	if brew list --cask --versions | grep joplin &>/dev/null; then
		@logshow "Removing [joplin desktop] using [brew]\n"
		brew uninstall --cask joplin # This will also install `nextcloudcmd` command

		if ! brew list --cask --versions | grep joplin &>/dev/null; then
			@logshow "Removed [joplin desktop] successfully using [brew]\n"
		else
			@logshow "Removed [joplin desktop] unsuccessfully using [brew]\n"
		fi
	fi
elif [[ "${AP_OS_TYPE}" == "${AP_OS_TYPE_UBUNTU}" ]]; then
	if [[ -n "${XDG_CURRENT_DESKTOP:-}" ]]; then
		@logshow "Removing [joplin desktop]\n"
		rm -rf ~/.joplin

		if [[ ! -x ~/.joplin/Joplin.AppImage ]]; then
			@logshow "Removed [joplin desktop] successfully\n"
		else
			@logshow "Removed [joplin desktop] unsuccessfully\n"
		fi
	fi
fi
