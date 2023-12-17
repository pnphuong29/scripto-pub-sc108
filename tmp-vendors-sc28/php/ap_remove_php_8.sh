if [[ "${AP_OS_TYPE}" == "${AP_OS_TYPE_MACOS}" ]]; then
	brew list --version | grep php@8.0 &>/dev/null
	if [[ "$?" == 0 ]]; then
		@logshow "Removing [PHP 8.0] using [brew]\n"
		brew uninstall php@8.0

		if [[ ! -f "/usr/local/opt/php@8.0/bin" ]]; then
			@logshowpassed "[PHP 8.0] has been removed successfully\n"
		else
			@logshowfailed "[PHP 8.0] has been removed unsuccessfully\n"
		fi
	fi
elif [[ "${AP_OS_TYPE}" == "${AP_OS_TYPE_UBUNTU}" ]]; then
	if type php &>/dev/null; then
		@logshow "Removing [PHP 8.0] using [apt]\n"
		sudo apt remove -y php8.0 libapache2-mod-php8.0

		if ! type php &>/dev/null; then
			@logshowpassed "[PHP 8.0] has been removed successfully\n"
		else
			@logshowfailed "[PHP 8.0] has been removed unsuccessfully\n"
		fi

	fi
fi
