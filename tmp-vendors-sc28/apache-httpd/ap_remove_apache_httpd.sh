# Apache httpd should have only 1 version in current system

if [[ "${AP_OS_TYPE}" == "${AP_OS_TYPE_MACOS}" ]]; then
	if brew list --version | grep httpd &>/dev/null; then
		@logshow "Removing Apache Httpd using [brew]\n"

		brew uninstall httpd
		rm -rf /usr/local/etc/httpd

		if ! brew list --version | grep httpd &>/dev/null; then
			@logshowpassed "[httpd] has been removed successfully using [brew]\n"
		else
			@logshowpassed "[httpd] has been removed unsuccessfully using [brew]\n"
		fi
	fi
elif [[ "${AP_OS_TYPE}" == "${AP_OS_TYPE_UBUNTU}" ]]; then
	@logshow "Removing Apache Httpd using [apt]\n"

	sudo apt purge -y apache2
	sudo apt autoremove -y
	sudo rm -rf /etc/apache2

	if ! type apache2ctl &>/dev/null; then
		@logshowpassed "[Apache 2] has been removed successfully using [apt]\n"
	else
		@logshowpassed "[Apache 2] has been removed unsuccessfully using [apt]\n"
	fi
fi
