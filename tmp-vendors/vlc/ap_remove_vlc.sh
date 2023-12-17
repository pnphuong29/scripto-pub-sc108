# https://www.videolan.org/vlc/

if type vlc &>/dev/null; then
	if [[ "${AP_OS_TYPE}" == "${AP_OS_TYPE_MACOS}" ]]; then
		@logshow "Removing [vlc] using [brew]\n"
		brew uninstall vlc

		if ! brew list --versions | grep vlc &>/dev/null; then
			@logshowpassed "[vlc] has been removed successfully using [brew]\n"
		else
			@logshowfailed "[vlc] has been removed unsuccessfully using [brew]\n"
		fi
	elif [[ "${AP_OS_TYPE}" == "${AP_OS_TYPE_UBUNTU}" ]]; then
		@logshow "Removing [vlc] using [apt]\n"
		sudo apt purge -y vlc
		sudo apt autoremove -y

		if ! type vlc; then
			@logshowpassed "[vlc] has been removed successfully using [apt]\n"
		else
			@logshowfailed "[vlc] has been removed unsuccessfully using [apt]\n"
		fi
	fi
fi
