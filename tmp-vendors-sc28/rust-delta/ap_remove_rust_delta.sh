if type delta &>/dev/null; then
	if type cargo &>/dev/null; then
		@logshow "Removing [delta] using [cargo]\n"
		cargo uninstall git-delta

		if ! type delta &>/dev/null; then
			@logshowpassed "[delta] has been removed successfully using [cargo]\n"
		else
			@logshowfailed "[delta] has been removed unsuccessfully using [cargo]\n"
		fi
	else
		if [[ "${AP_OS_TYPE}" == "${AP_OS_TYPE_MACOS}" ]]; then
			@logshow "Removing [delta] using [brew]\n"

			brew uninstall git-delta

			if ! type delta &>/dev/null; then
				@logshowpassed "[delta] has been removed successfully using [brew]\n"
			else
				@logshowfailed "[delta] has been removed unsuccessfully using [brew]\n"
			fi
		elif [[ "${AP_OS_TYPE}" == "${AP_OS_TYPE_UBUNTU}" ]]; then
			@logshow "Removing [delta] using [apt]\n"

			sudo apt remove -y git-delta

			if ! type delta &>/dev/null; then
				@logshowpassed "[delta] has been removed successfully using [apt]\n"
			else
				@logshowfailed "[delta] has been removed unsuccessfully using [apt]\n"
			fi
		fi
	fi

fi
