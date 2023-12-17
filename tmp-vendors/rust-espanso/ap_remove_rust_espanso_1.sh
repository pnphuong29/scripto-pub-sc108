# # https://espanso.org/install/

export AP_VENDORS_ESPANSO_GH_DIR="${AP_GH_DIR}/federico-terzi/espanso"

if type espanso &>/dev/null; then
	export AP_VENDORS_ESPANSO_CONFIG_DIR="$(espanso path config)"
fi

if type espanso &>/dev/null; then
	if type cargo &>/dev/null; then
		@logshow "Removing [espanso]\n"

		# Stop and unregister espanso service
		espanso stop
		espanso service unregister

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
