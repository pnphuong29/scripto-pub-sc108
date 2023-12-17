# # https://espanso.org/install/

if type espanso &>/dev/null; then
	export AP_VENDORS_ESPANSO_CONFIG_DIR="$(espanso path config)"
fi

if type espanso &>/dev/null; then
	# Stop and unregister espanso service
	espanso stop
	espanso service unregister

	if [[ "${AP_OS_TYPE}" == "${AP_OS_TYPE_MACOS}" ]]; then
		@logshow "Removing [espanso] using [brew]\n"

		brew uninstall --cask espanso

		if ! type espanso &>/dev/null; then
			@logshowpassed "[espanso] has been removed successfully using [brew]\n"
		else
			@logshowfailed "[espanso] has been removed unsuccessfully using [brew]\n"
		fi
	elif [[ "${AP_OS_TYPE}" == "${AP_OS_TYPE_UBUNTU}" ]]; then
		if type cargo &>/dev/null; then
			export AP_VENDORS_ESPANSO_GH_DIR="${AP_GH_DIR}/federico-terzi/espanso"
			@logshow "Removing [espanso]\n"

			# Remove files and directories
			rm -f "${AP_SOFT_DIR}/bin/espanso"
			rm -rf "${AP_VENDORS_ESPANSO_GH_DIR}"

			if [[ -n "${AP_VENDORS_ESPANSO_CONFIG_DIR:-}" ]]; then
				rm -rf "${AP_VENDORS_ESPANSO_CONFIG_DIR}"
			fi
		fi

		# Validation
		if [[ ! -f "${AP_SOFT_DIR}/bin/espanso" ]]; then
			@logshowpassed "[espanso] has been removed successfully\n"
		else
			@logshowfailed "[espanso] has been removed unsuccessfully\n"
		fi
	fi
fi
