# https://github.com/sayanarijit/xplr

if type xplr &>/dev/null; then
	if [[ "${AP_OS_TYPE}" == "${AP_OS_TYPE_MACOS}" ]]; then
		@logshow "Removing [xplr] using [brew]\n"
		brew remove xplr

		if ! type xplr &>/dev/null; then
			@logshowpassed "[xplr] has been removed successfully using [brew]\n"
		else
			@logshowfailed "[xplr] has been removed unsuccessfully using [brew]\n"
		fi
	else
		@logshow "Removing [xplr]\n"
		rm -f "${AP_SOFT_DIR}/bin/xplr"

		if ! type xplr &>/dev/null; then
			@logshowpassed "[xplr] has been removed successfully\n"
		else
			@logshowfailed "[xplr] has been removed unsuccessfully\n"
		fi
	fi
fi
