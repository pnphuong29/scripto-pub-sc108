# https://github.com/atanunq/viu#installation
# Dependencies: ghq

export AP_VENDORS_RUST_VIU_SETUP_DIR="${AP_SCRIPTO_COMMON_DIR}/vendors/rust-viu"
export AP_VENDORS_RUST_VIU_REPO_URL="https://github.com/atanunq/viu.git"
export AP_VENDORS_RUST_VIU_GH_DIR="${AP_GH_DIR}/atanunq/viu"

if ! type viu &>/dev/null; then
	if [[ "${AP_OS_TYPE}" == "${AP_OS_TYPE_MACOS}" ]]; then
		@logshow "Installing [viu] using [brew]\n"
		brew install viu

		if brew list --versions | grep viu &>/dev/null; then
			@logshowpassed "[viu] has been installed successfully using [brew]\n"
		else
			@logshowfailed "[viu] has been installed unsuccessfully using [brew]\n"
		fi
	elif [[ "${AP_OS_TYPE}" == "${AP_OS_TYPE_UBUNTU}" ]]; then
		@logshow "Installing [viu] using [cargo]\n"

		ghq get "${AP_VENDORS_RUST_VIU_REPO_URL}"
		cd "${AP_VENDORS_RUST_VIU_GH_DIR}"
		cargo install --path .

		if type viu &>/dev/null; then
			@logshowpassed "[viu] has been installed successfully using [cargo]\n"
		else
			@logshowfailed "[viu] has been installed unsuccessfully using [cargo]\n"
		fi
	fi
fi
