# https://github.com/nextcloud/desktop
# https://nextcloud.com/install/#install-clients

export AP_VENDORS_NEXTCLOUD_DESKTOP_SETUP_DIR="${AP_SCRIPTO_COMMON_DIR}/vendors/nextcloud-dektop"

if [[ "${AP_OS_TYPE}" == "${AP_OS_TYPE_MACOS}" ]]; then
	if ! brew list --cask --versions | grep nextcloud &>/dev/null; then
		@logshow "Installing [nextcloud desktop] using [brew]\n"
		brew install --cask nextcloud # This will also install `nextcloudcmd` command

		if brew list --cask --versions | grep nextcloud &>/dev/null; then
			@logshow "Installed [nextcloud desktop] successfully using [brew]\n"
		else
			@logshow "Installed [nextcloud desktop] unsuccessfully using [brew]\n"
		fi
	fi
elif [[ "${AP_OS_TYPE}" == "${AP_OS_TYPE_UBUNTU}" ]]; then
	if [[ -n "${XDG_CURRENT_DESKTOP:-}" ]]; then
		export AP_VENDORS_NEXTCLOUD_DESKTOP_VERSION='3.6.1'
		export AP_VENDORS_NEXTCLOUD_DESKTOP_BIN_FILE_NAME="Nextcloud-${AP_VENDORS_NEXTCLOUD_DESKTOP_VERSION}-x86_64.AppImage"
		export AP_VENDORS_NEXTCLOUD_DESKTOP_DL_URL="https://github.com/nextcloud/desktop/releases/download/v${AP_VENDORS_NEXTCLOUD_DESKTOP_VERSION}/${AP_VENDORS_NEXTCLOUD_DESKTOP_BIN_FILE_NAME}"
		export AP_VENDORS_NEXTCLOUD_DESKTOP_DIR="${AP_SOFT_DIR}/nextcloud"
		export AP_VENDORS_NEXTCLOUD_DESKTOP_BIN_FILE_PATH="${AP_VENDORS_NEXTCLOUD_DESKTOP_DIR}/${AP_VENDORS_NEXTCLOUD_DESKTOP_BIN_FILE_NAME}"

		@logshow "Installing [nextcloud desktop v${AP_VENDORS_NEXTCLOUD_DESKTOP_VERSION}]\n"
		mkdir -p "${AP_VENDORS_NEXTCLOUD_DESKTOP_DIR}"
		curl -SL "${AP_VENDORS_NEXTCLOUD_DESKTOP_DL_URL}" >"${AP_VENDORS_NEXTCLOUD_DESKTOP_BIN_FILE_PATH}"
		chmod +x "${AP_VENDORS_NEXTCLOUD_DESKTOP_BIN_FILE_PATH}"
		ln -sf "${AP_VENDORS_NEXTCLOUD_DESKTOP_BIN_FILE_PATH}" "${AP_SOFT_DIR}/bin/nextcloud"

		if type nextcloud; then
			@logshow "Installed [nextcloud desktop] successfully\n"
		else
			@logshow "Installed [nextcloud desktop] unsuccessfully\n"
		fi
	fi
fi
