# https://sw.kovidgoyal.net/kitty/binary/

export AP_VENDORS_PYTHON_KITTY_SETUP_DIR="${AP_SCRIPTO_COMMON_DIR}/vendors/python-kitty"
export AP_VENDORS_PYTHON_KITTY_SETUP_CONFIGS_DIR="${AP_VENDORS_PYTHON_KITTY_SETUP_DIR}/configs"
export AP_VENDORS_PYTHON_KITTY_REPO_URL="https://github.com/kovidgoyal/kitty"
export AP_VENDORS_PYTHON_KITTY_GH_DIR="${AP_GH_DIR}/kovidgoyal/kitty"
export AP_VENDORS_PYTHON_KITTY_THEMES_REPO_URL="https://github.com/dexpota/kitty-themes"
export AP_VENDORS_PYTHON_KITTY_THEMES_GH_DIR="${AP_GH_DIR}/dexpota/kitty-themes"

if type kitty &>/dev/null; then
	@logshow "Removing [kitty]\n"

	if [[ "${AP_OS_TYPE}" == "${AP_OS_TYPE_MACOS}" ]]; then
		rm -rf /Applications/kitty.app
	elif [[ "${AP_OS_TYPE}" == "${AP_OS_TYPE_UBUNTU}" ]]; then
		rm -rf ~/.local/kitty.app
	fi

	rm -rf ~/.config/kitty
	rm -rf "${AP_VENDORS_PYTHON_KITTY_THEMES_GH_DIR}"

	if ! type kitty &>/dev/null; then
		@logshowpassed "[kitty] has been removed successfully\n"
	else
		@logshowfailed "[kitty] has been removed unsuccessfully\n"
	fi
fi
