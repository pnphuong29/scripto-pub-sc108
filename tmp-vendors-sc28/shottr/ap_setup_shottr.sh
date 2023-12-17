# https://shottr.cc/

export AP_VENDORS_SHOTTR_SETUP_DIR="${AP_SCRIPTO_COMMON_DIR}/vendors/shottr"

if [[ "${AP_OS_TYPE}" == "${AP_OS_TYPE_MACOS}" ]]; then
	if ! brew list --versions | grep shottr &>/dev/null; then
		@logshow "Installing [shottr] using [brew]\n"
		brew install --cask shottr

		if brew list --versions | grep shottr &>/dev/null; then
			@logshowpassed "[shottr] has been installed successfully using [brew]\n"
		else
			@logshowfailed "[shottr] has been installed unsuccessfully using [brew]\n"
		fi
	fi
fi
