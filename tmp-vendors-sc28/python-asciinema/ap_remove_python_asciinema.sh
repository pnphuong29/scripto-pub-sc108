# https://asciinema.org/docs/installation
# https://github.com/asciinema/asciinema

export AP_VENDORS_PYTHON_ASCIINEMA_SETUP_DIR="${AP_SCRIPTO_COMMON_DIR}/vendors/python-asciinema"
export AP_VENDORS_PYTHON_ASCIINEMA_SETUP_CONFIGS_DIR="${AP_VENDORS_PYTHON_ASCIINEMA_SETUP_DIR}/configs"
export AP_VENDORS_PYTHON_ASCIINEMA_REPO_URL="https://github.com/asciinema/asciinema"
export AP_VENDORS_PYTHON_ASCIINEMA_GH_DIR="${AP_GH_DIR}/asciinema/asciinema"

if type asciinema &>/dev/null; then
	@logshow "Removing [asciinema] using [pip]\n"
	pip3 uninstall asciinema

	if ! type asciinema &>/dev/null; then
		@logshowpassed "[asciinema] has been removed successfully using [pip]\n"
	else
		@logshowfailed "[asciinema] has been removed unsuccessfully using [pip]\n"
	fi
fi
