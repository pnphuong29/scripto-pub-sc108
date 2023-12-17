#

export AP_VENDORS_XXX_SETUP_DIR="${AP_SCRIPTO_COMMON_DIR}/vendors/xxx"
export AP_VENDORS_XXX_SETUP_CONFIGS_DIR="${AP_VENDORS_XXX_SETUP_DIR}/configs"
export AP_VENDORS_XXX_REPO_URL=""
export AP_VENDORS_XXX_GH_DIR="${AP_GH_DIR}/xxx"
export AP_VENDORS_XXX_DIR="${AP_SOFT_DIR}/xxx"

if ! type xxx &>/dev/null; then
	if [[ "${AP_OS_TYPE}" == "${AP_OS_TYPE_MACOS}" ]]; then
		@logshow "Installing [xxx] using [brew]\n"
		brew install xxx

		if brew list --versions | grep xxx &>/dev/null; then
			@logshowpassed "[xxx] has been installed successfully using [brew]\n"
		else
			@logshowfailed "[xxx] has been installed unsuccessfully using [brew]\n"
		fi
	elif [[ "${AP_OS_TYPE}" == "${AP_OS_TYPE_UBUNTU}" ]]; then
		@logshow "Installing [xxx] using [apt]\n"
		sudo apt install -y xxx

		if type xxx &>/dev/null; then
			# if [[ ! -d "${ap_xxx_dir}" ]]; then
			@logshowpassed "[xxx] has been installed successfully using [apt]\n"
		else
			@logshowfailed "[xxx] has been installed unsuccessfully using [apt]\n"
		fi
	fi
fi
