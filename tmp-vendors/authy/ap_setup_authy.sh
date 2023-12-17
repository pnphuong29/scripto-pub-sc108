# https://authy.com/

export AP_VENDORS_AUTHY_SETUP_DIR="${AP_SCRIPTO_COMMON_DIR}/vendors/authy"
export AP_VENDORS_AUTHY_SETUP_CONFIGS_DIR="${AP_VENDORS_AUTHY_SETUP_DIR}/configs"

if [[ "${AP_OS_TYPE}" == "${AP_OS_TYPE_MACOS}" ]]; then
	@logshow "Installing [authy] using [brew]\n"
	brew install --cask authy

	if brew list --versions | grep authy &>/dev/null; then
		@logshowpassed "[authy] has been installed successfully using [brew]\n"
	else
		@logshowfailed "[authy] has been installed unsuccessfully using [brew]\n"
	fi
elif [[ "${AP_OS_TYPE}" == "${AP_OS_TYPE_UBUNTU}" ]]; then
	@logshow "Installing [authy] using [snap]\n"
	sudo snap install authy

	if type authy &>/dev/null; then
		@logshowpassed "[authy] has been installed successfully using [apt]\n"
	else
		@logshowfailed "[authy] has been installed unsuccessfully using [apt]\n"
	fi
fi
