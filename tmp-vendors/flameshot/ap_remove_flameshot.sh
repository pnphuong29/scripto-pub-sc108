# https://github.com/flameshot-org/flameshot#installation

if [[ "${AP_OS_TYPE}" == "${AP_OS_TYPE_MACOS}" ]]; then
	if brew list --versions | grep flameshot &>/dev/null; then
		@logshow "Removing [flameshot] using [brew]\n"
		brew uninstall flameshot

		if ! brew list --versions | grep flameshot &>/dev/null; then
			@logshowpassed "[flameshot] has been removed successfully using [brew]\n"
		else
			@logshowfailed "[flameshot] has been removed unsuccessfully using [brew]\n"
		fi
	fi
elif [[ "${AP_OS_TYPE}" == "${AP_OS_TYPE_UBUNTU}" ]]; then
	if type flameshot &>/dev/null; then
		@logshow "Removing [flameshot] using [snap]\n"
		sudo snap remove --purge flameshot

		if ! type flameshot &>/dev/null; then
			@logshowpassed "[flameshot] has been removed successfully using [snap]\n"
		else
			@logshowfailed "[flameshot] has been removed unsuccessfully using [snap]\n"
		fi
	fi
fi
