# https://github.com/ksnip/ksnip#installing-binaries

export AP_VENDORS_KSNIP_SETUP_DIR="${AP_SCRIPTO_COMMON_DIR}/vendors/ksnip"
export AP_VENDORS_KSNIP_SETUP_CONFIGS_DIR="${AP_VENDORS_KSNIP_SETUP_DIR}/configs"

if ! type ksnip &>/dev/null; then
	if [[ "${AP_OS_TYPE}" == "${AP_OS_TYPE_MACOS}" ]]; then
		@logshow "Installing [ksnip] using [brew]\n"
		brew install --cask ksnip

		if brew list --versions | grep ksnip &>/dev/null; then
			@logshowpassed "[ksnip] has been installed successfully using [brew]\n"
		else
			@logshowfailed "[ksnip] has been installed unsuccessfully using [brew]\n"
		fi
	elif [[ "${AP_OS_TYPE}" == "${AP_OS_TYPE_UBUNTU}" ]]; then
		@logshow "Installing [ksnip] using [snap]\n"
		sudo snap install ksnip

		if type ksnip &>/dev/null; then
			@logshowpassed "[ksnip] has been installed successfully using [snap]\n"
		else
			@logshowfailed "[ksnip] has been installed unsuccessfully using [snap]\n"
		fi
	fi
fi
