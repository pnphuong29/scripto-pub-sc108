# https://www.videolan.org/vlc/

export AP_VENDORS_VLC_SETUP_DIR="${AP_SCRIPTO_COMMON_DIR}/vendors/vlc"

if ! type vlc &>/dev/null; then

	if [[ "${AP_OS_TYPE}" == "${AP_OS_TYPE_MACOS}" ]]; then
		@logshow "Installing [vlc] using [brew]\n"
		brew install vlc

		if brew list --versions | grep vlc &>/dev/null; then
			@logshowpassed "[vlc] has been installed successfully using [brew]\n"
		else
			@logshowfailed "[vlc] has been installed unsuccessfully using [brew]\n"
		fi
	elif [[ "${AP_OS_TYPE}" == "${AP_OS_TYPE_UBUNTU}" ]]; then
		@logshow "Installing [vlc] using [apt]\n"
		sudo apt install -y vlc

		if type vlc; then
			@logshowpassed "[vlc] has been installed successfully using [apt]\n"
		else
			@logshowfailed "[vlc] has been installed unsuccessfully using [apt]\n"
		fi
	fi
fi
