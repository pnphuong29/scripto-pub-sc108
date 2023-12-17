if [[ "${AP_OS_TYPE}" == "${AP_OS_TYPE_MACOS}" ]]; then
	@logshow "Removing [dbeaver] using [brew]\n"
	brew uninstall --cask dbeaver-community

	if ! brew list --versions | grep dbeaver &>/dev/null; then
		@logshowpassed "[dbeaver] has been removed successfully using [brew]\n"
	else
		@logshowfailed "[dbeaver] has been removed unsuccessfully using [brew]\n"
	fi
elif [[ "${AP_OS_TYPE}" == "${AP_OS_TYPE_UBUNTU}" ]]; then
	@logshow "Removing [dbeaver] using [snap]\n"
	sudo snap remove --purge dbeaver-ce

	if ! snap list | grep dbeaver-ce &>/dev/null; then
		@logshowpassed "[dbeaver] has been removed successfully using [snap]\n"
	else
		@logshowfailed "[dbeaver] has been removed unsuccessfully using [snap]\n"
	fi
fi
