# https://authy.com/

export AP_VENDORS_AUTHY_SETUP_DIR="${AP_SCRIPTO_COMMON_DIR}/vendors/authy"
export AP_VENDORS_AUTHY_SETUP_CONFIGS_DIR="${AP_VENDORS_AUTHY_SETUP_DIR}/configs"

if [[ "${AP_OS_TYPE}" == "${AP_OS_TYPE_MACOS}" ]]; then
	@logshow "Removing [xxx] using [brew]\n"
	brew uninstall authy

	if ! brew list --versions | grep authy &>/dev/null; then
		@logshowpassed "[authy] has been uninstalled successfully using [brew]\n"
	else
		@logshowfailed "[authy] has been uninstalled unsuccessfully using [brew]\n"
	fi
elif [[ "${AP_OS_TYPE}" == "${AP_OS_TYPE_UBUNTU}" ]]; then
	@logshow "Removing [authy] using [snap]\n"
	sudo snap uninstall authy

	if ! type authy &>/dev/null; then
		@logshowpassed "[authy] has been uninstalled successfully using [snap]\n"
	else
		@logshowfailed "[authy] has been uninstalled unsuccessfully using [snap]\n"
	fi
fi
