# https://github.com/chubin/cheat.sh

export AP_VENDORS_CHT_SH_SETUP_DIR="${AP_SCRIPTO_COMMON_DIR}/vendors/cht-sh"
export AP_VENDORS_CHT_SH_SETUP_CONFIGS_DIR="${AP_VENDORS_CHT_SH_SETUP_DIR}/configs"

if [[ ! -f "${AP_SOFT_DIR}/bin/cht.sh" ]]; then
	@logshow "Installing [cht.sh]\n"

	# Install cht.sh
	curl -L https://cht.sh/:cht.sh >"${AP_SOFT_DIR}/bin/cht.sh"
	chmod +x "${AP_SOFT_DIR}/bin/cht.sh"

	# Bash completion
	curl -SsL "https://cheat.sh/:bash_completion" -o "${AP_VENDORS_CHT_SH_SETUP_CONFIGS_DIR}/ap_completion_cht_sh.bash"

	if type cht.sh &>/dev/null; then
		@logshowpassed "[cht.sh] has been installed successfully\n"
	else
		@logshowfailed "[cht.sh] has been installed unsuccessfully\n"
	fi
fi
