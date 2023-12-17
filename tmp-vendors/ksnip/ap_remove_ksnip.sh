# https://github.com/ksnip/ksnip#installing-binaries

export AP_VENDORS_KSNIP_SETUP_DIR="${AP_SCRIPTO_COMMON_DIR}/vendors/ksnip"
export AP_VENDORS_KSNIP_SETUP_CONFIGS_DIR="${AP_VENDORS_KSNIP_SETUP_DIR}/configs"

if type ksnip &>/dev/null; then
	if [[ "${AP_OS_TYPE}" == "${AP_OS_TYPE_MACOS}" ]]; then
		@logshow "Removing [ksnip] using [brew]\n"
		brew uninstall ksnip

		if ! brew list --versions | grep ksnip &>/dev/null; then
			@logshowpassed "[ksnip] has been removed successfully using [brew]\n"
		else
			@logshowfailed "[ksnip] has been removed unsuccessfully using [brew]\n"
		fi
	elif [[ "${AP_OS_TYPE}" == "${AP_OS_TYPE_UBUNTU}" ]]; then
		@logshow "Removing [ksnip] using [snap]\n"
		sudo snap remove --purge ksnip

		if ! type ksnip &>/dev/null; then
			@logshowpassed "[ksnip] has been removed successfully using [snap]\n"
		else
			@logshowfailed "[ksnip] has been removed unsuccessfully using [snap]\n"
		fi
	fi
fi
