if [[ "${AP_OS_TYPE}" == "${AP_OS_TYPE_MACOS}" ]]; then
	@logshow "Removing [nextcloud desktop] using [brew]\n"
	brew uninstall --cask nextcloud

	if ! brew list --cask --versions | grep nextcloud &>/dev/null; then
		@logshow "Removed [nextcloud desktop] successfully using [brew]\n"
	else
		@logshow "Removed [nextcloud desktop] unsuccessfully using [brew]\n"
	fi
elif [[ "${AP_OS_TYPE}" == "${AP_OS_TYPE_UBUNTU}" ]]; then
	@logshow "Removing [nextcloud desktop] using [apt]\n"

	sudo apt purge -y nextcloud-desktop
	sudo apt autoremove -y

	if ! type nextcloud &>/dev/null; then
		@logshow "Removed [nextcloud desktop] successfully\n"
	else
		@logshow "Removed [nextcloud desktop] unsuccessfully\n"
	fi
fi
