if [[ "${AP_OS_TYPE}" == "${AP_OS_TYPE_MACOS}" ]]; then
	if brew list --cask --versions | grep nextcloud &>/dev/null; then
		@logshow "Removing [nextcloud desktop] using [brew]\n"
		brew uninstall --cask nextcloud

		if ! brew list --cask --versions | grep nextcloud &>/dev/null; then
			@logshow "Removed [nextcloud desktop] successfully using [brew]\n"
		else
			@logshow "Removed [nextcloud desktop] unsuccessfully using [brew]\n"
		fi
	fi
elif [[ "${AP_OS_TYPE}" == "${AP_OS_TYPE_UBUNTU}" ]]; then
	if [[ -n "${XDG_CURRENT_DESKTOP:-}" ]]; then
		if type nextcloud; then
			export AP_VENDORS_NEXTCLOUD_DESKTOP_VERSION='3.6.0'
			export AP_VENDORS_NEXTCLOUD_DESKTOP_BIN_FILE_NAME="Nextcloud-${AP_VENDORS_NEXTCLOUD_DESKTOP_VERSION}-x86_64.AppImage"
			export AP_VENDORS_NEXTCLOUD_DESKTOP_DIR="${AP_SOFT_DIR}/nextcloud"
			export AP_VENDORS_NEXTCLOUD_DESKTOP_BIN_FILE_PATH="${AP_VENDORS_NEXTCLOUD_DESKTOP_DIR}/${AP_VENDORS_NEXTCLOUD_DESKTOP_BIN_FILE_NAME}"

			@logshow "Removing [nextcloud desktop v${AP_VENDORS_NEXTCLOUD_DESKTOP_VERSION}]\n"
			rm -f "${AP_SOFT_DIR}/bin/nextcloud"
			rm -f "${AP_VENDORS_NEXTCLOUD_DESKTOP_BIN_FILE_PATH}"

			if ! type nextcloud; then
				@logshow "Removed [nextcloud desktop] successfully\n"
			else
				@logshow "Removed [nextcloud desktop] unsuccessfully\n"
			fi
		fi
	fi
fi
