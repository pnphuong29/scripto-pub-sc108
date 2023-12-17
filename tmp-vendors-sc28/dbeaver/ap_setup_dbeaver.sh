# https://dbeaver.io/download/

if [[ "${AP_OS_TYPE}" == "${AP_OS_TYPE_MACOS}" ]]; then
	@logshow "Installing [dbeaver] using [brew]\n"
	brew install --cask dbeaver-community

	if brew list --versions | grep dbeaver &>/dev/null; then
		@logshowpassed "[dbeaver] has been installed successfully using [brew]\n"
	else
		@logshowfailed "[dbeaver] has been installed unsuccessfully using [brew]\n"
	fi
elif [[ "${AP_OS_TYPE}" == "${AP_OS_TYPE_UBUNTU}" ]]; then
	@logshow "Installing [dbeaver] using [snap]\n"
	sudo snap install dbeaver-ce

	if snap list | grep dbeaver-ce &>/dev/null; then
		@logshowpassed "[dbeaver] has been installed successfully using [snap]\n"
	else
		@logshowfailed "[dbeaver] has been installed unsuccessfully using [snap]\n"
	fi
fi
