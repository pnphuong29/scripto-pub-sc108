# https://imagemagick.org/script/download.php

if [[ "${AP_OS_TYPE}" == "${AP_OS_TYPE_MACOS}" ]]; then
	brew list --version | grep imagemagick &>/dev/null
	if [[ "$?" == 0 ]]; then
		@logshow "Removing [imagemagick] using [brew]\n"
		brew uninstall imagemagick

		if ! type display &>/dev/null; then
			@logshowpassed "[imagemagick] has been removed successfully\n"
		else
			@logshowfailed "[imagemagick] has been removed unsuccessfully\n"
		fi
	fi
elif [[ "${AP_OS_TYPE}" == "${AP_OS_TYPE_UBUNTU}" ]]; then
	if type imagemagick &>/dev/null; then
		@logshow "Removing [imagemagick] using [apt]\n"

		sudo apt purge -y imagemagick
		sudo apt autoremove -y

		if ! type display &>/dev/null; then
			@logshowpassed "[imagemagick] has been removed successfully\n"
		else
			@logshowfailed "[imagemagick] has been removed unsuccessfully\n"
		fi
	fi
fi
