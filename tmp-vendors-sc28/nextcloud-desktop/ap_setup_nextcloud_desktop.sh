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
		@logshow "Installing [nextcloud desktop] using [apt]\n"
		sudo apt install -y nextcloud-desktop

		if type nextcloud &>/dev/null; then
			@logshow "Installed [nextcloud desktop] successfully using [apt]\n"
		else
			@logshow "Installed [nextcloud desktop] unsuccessfully using [apt]\n"
		fi
	fi
fi
