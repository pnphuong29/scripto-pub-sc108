# https://github.com/atanunq/viu#installation

export AP_VENDORS_RUST_VIU_SETUP_DIR="${AP_SCRIPTO_COMMON_DIR}/vendors/rust-viu"
export AP_VENDORS_RUST_VIU_REPO_URL="https://github.com/atanunq/viu.git"
export AP_VENDORS_RUST_VIU_GH_DIR="${AP_GH_DIR}/atanunq/viu"

if type viu &>/dev/null; then
	if [[ "${AP_OS_TYPE}" == "${AP_OS_TYPE_MACOS}" ]]; then
		@logshow "Removing [viu] using [brew]\n"
		brew uninstall viu

		if ! brew list --versions | grep viu &>/dev/null; then
			@logshowpassed "[viu] has been removed successfully using [brew]\n"
		else
			@logshowfailed "[viu] has been removed unsuccessfully using [brew]\n"
		fi
	elif [[ "${AP_OS_TYPE}" == "${AP_OS_TYPE_UBUNTU}" ]]; then
		@logshow "Removing [viu] using [apt]\n"

		cargo uninstall viu
		rm -rf "${AP_VENDORS_RUST_VIU_GH_DIR}"

		if ! type viu &>/dev/null; then
			@logshowpassed "[viu] has been removed successfully using [cargo]\n"
		else
			@logshowfailed "[viu] has been removed unsuccessfully using [cargo]\n"
		fi
	fi
fi
