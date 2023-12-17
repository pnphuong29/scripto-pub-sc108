# https://joplinapp.org/terminal/

if [[ "${AP_OS_TYPE}" == "${AP_OS_TYPE_MACOS}" ]]; then
	if type joplin &>/dev/null; then
		@logshow "Removing [joplin cli] using [npm]\n"
		npm -g uninstall joplin

		if ! type joplin &>/dev/null; then
			@logshow "Removed [joplin cli] successfully using [npm]\n"
		else
			@logshow "Removed [joplin cli] unsuccessfully using [npm]\n"
		fi
	fi
fi
