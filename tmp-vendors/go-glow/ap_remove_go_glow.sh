# https://github.com/charmbracelet/glow#installation

if type glow &>/dev/null; then
	if [[ "${AP_OS_TYPE}" == "${AP_OS_TYPE_MACOS}" ]]; then
		@logshow "Removing [glow] using [brew]\n"
		brew remove glow

		if brew list --versions | grep glow &>/dev/null; then
			@logshowpassed "[glow] has been removed successfully using [brew]\n"
		else
			@logshowfailed "[glow] has been removed unsuccessfully using [brew]\n"
		fi
	elif [[ "${AP_OS_TYPE}" == "${AP_OS_TYPE_UBUNTU}" ]]; then
		@logshow "Removing [glow] using [apt]\n"

		sudo apt-get purge -y glow
		sudo apt autoremove -y

		if ! type glow &>/dev/null; then
			@logshowpassed "[glow] has been removed successfully using [apt]\n"
		else
			@logshowfailed "[glow] has been removed unsuccessfully using [apt]\n"
		fi
	fi
fi
