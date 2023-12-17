# https://imagemagick.org/script/download.php

if [[ "${AP_OS_TYPE}" == "${AP_OS_TYPE_MACOS}" ]]; then
	brew list --version | grep imagemagick &>/dev/null
	if [[ "$?" != 0 ]]; then
		@logshow "Installing [imagemagick] using [brew]\n"
		brew install imagemagick

		if type display; then
			@logshowpassed "[imagemagick] has been installed successfully\n"
		else
			@logshowfailed "[imagemagick] has been installed unsuccessfully\n"
		fi
	fi
elif [[ "${AP_OS_TYPE}" == "${AP_OS_TYPE_UBUNTU}" ]]; then
	if ! type display &>/dev/null; then
		@logshow "Installing [imagemagick] using [apt]\n"

		sudo apt update
		sudo apt install -y imagemagick

		if type display; then
			@logshowpassed "[imagemagick] has been installed successfully\n"
		else
			@logshowfailed "[imagemagick] has been installed unsuccessfully\n"
		fi
	fi
fi
