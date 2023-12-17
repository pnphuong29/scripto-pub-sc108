# https://github.com/chubin/cheat.sh

export AP_VENDORS_CHT_SH_SETUP_DIR="${AP_SCRIPTO_COMMON_DIR}/vendors/cht-sh"
export AP_VENDORS_CHT_SH_SETUP_CONFIGS_DIR="${AP_VENDORS_CHT_SH_SETUP_DIR}/configs"

if type cht.sh &>/dev/null; then
	@logshow "Removing [cht.sh]\n"
	rm -f "${AP_SOFT_DIR}/bin/cht.sh"

	if ! type cht.sh &>/dev/null; then
		@logshowpassed "[cht.sh] has been removed successfully\n"
	else
		@logshowfailed "[cht.sh] has been removed unsuccessfully\n"
	fi
fi
