# https://github.com/sebastiencs/icons-in-terminal
export AP_VENDORS_FONT_ICONS_IN_TERMINAL_DIR="${AP_GH_DIR}/sebastiencs/icons-in-terminal"
export AP_VENDORS_FONT_ICONS_IN_TERMINAL_DATA_DIR="${XDG_DATA_HOME:-${HOME}/.local/share}/icons-in-terminal/"

if [[ -d "${AP_VENDORS_FONT_ICONS_IN_TERMINAL_DIR}" ]]; then
	@logshow "Removing [icons-in-terminal]\n"

	cd "${AP_VENDORS_FONT_ICONS_IN_TERMINAL_DIR}"
	./uninstall.sh

	if [[ ! -d "${ap_g_icons_in_terminal_data_dir}" ]]; then
		@logshowpassed "[icons-in-terminal] has been removed successfully\n"
		rm -rf "${AP_VENDORS_FONT_ICONS_IN_TERMINAL_DIR}"
	else
		@logshowfailed "[icons-in-terminal] has been removed unsuccessfully\n"
	fi
fi

# Firacode
if [[ "${AP_OS_TYPE}" == "${AP_OS_TYPE_MACOS}" ]]; then
	@logshow "Removing [font-fira-code] using [brew]\n"
	brew uninstall --cask font-fira-code
elif [[ "${AP_OS_TYPE}" == "${AP_OS_TYPE_UBUNTU}" ]]; then
	@logshow "Removing [font-fira-code] using [apt]\n"
	sudo apt purge -y fonts-firacode
	sudo apt autoremove -y
fi
