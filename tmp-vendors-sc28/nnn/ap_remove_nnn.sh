# https://github.com/jarun/nnn
# https://github.com/jarun/nnn/wiki/Usage

export AP_NNN_SETUP_VERSION='4.6'
export AP_VENDORS_NNN_SETUP_DIR="${AP_SCRIPTO_COMMON_DIR}/vendors/nnn"
export AP_VENDORS_NNN_SETUP_CONFIGS_DIR="${AP_VENDORS_NNN_SETUP_DIR}/configs"
export AP_VENDORS_NNN_DIR="${AP_SOFT_DIR}/nnn/nnn-${AP_NNN_SETUP_VERSION}"
export AP_VENDORS_NNN_REPO_URL="https://github.com/jarun/nnn"

if type nnn &>/dev/null; then
	@logshow "Removing [nnn v${AP_NNN_SETUP_VERSION}]\n"

	rm -rf "${AP_VENDORS_NNN_DIR}"
	sudo rm -f /usr/local/bin/nnn

	if ! type nnn &>/dev/null; then
		@logshowpassed "[nnn v${AP_NNN_SETUP_VERSION}] has been removed successfully\n"
	else
		@logshowfailed "[nnn v${AP_NNN_SETUP_VERSION}] has been removed unsuccessfully\n"
	fi
fi
