# https://www.xnview.com/en/xnviewmp/#downloads

if [[ "${AP_OS_TYPE}" == "${AP_OS_TYPE_MACOS}" ]]; then
	if brew list --versions | grep xnviewmp &>/dev/null; then
		brew uninstall --cask xnviewmp

		if ! brew list --versions | grep xnviewmp &>/dev/null; then
			@logshowpassed "[xnviewmp] has been removed successfully\n"
		else
			@logshowfailed "[xnviewmp] has been removed unsuccessfully\n"
		fi
	fi

	if brew list --versions | grep xnconvert &>/dev/null; then
		brew uninstall --cask xnconvert

		if ! brew list --versions | grep xnconvert &>/dev/null; then
			@logshowpassed "[xnconvert] has been removed successfully\n"
		else
			@logshowfailed "[xnconvert] has been removed unsuccessfully\n"
		fi
	fi
elif [[ "${AP_OS_TYPE}" == "${AP_OS_TYPE_UBUNTU}" ]]; then
	if type xnview &>/dev/null; then
		@logshow "Removing [xnview]\n"
		sudo dpkg --purge xnview

		if ! type xnview; then
			@logshowpassed "[xnview] has been removed successfully\n"
		else
			@logshowfailed "[xnview] has been removed unsuccessfully\n"
		fi
	fi

	if type xnconvert &>/dev/null; then
		@logshow "Removing [xnconvert]\n"
		sudo dpkg --purge xnconvert

		if ! type xnconvert; then
			@logshowpassed "[xnconvert] has been removed successfully\n"
		else
			@logshowfailed "[xnconvert] has been removed unsuccessfully\n"
		fi
	fi
fi
