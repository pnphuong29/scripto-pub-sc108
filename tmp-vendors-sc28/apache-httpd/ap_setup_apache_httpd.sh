# Apache httpd should have only 1 version in current system

if [[ "${AP_OS_TYPE}" == "${AP_OS_TYPE_MACOS}" ]]; then
	if ! brew list --version | grep httpd &>/dev/null; then
		@logshow "Installing [httpd] using brew\n"
		brew install httpd

		brew list --version | grep httpd &>/dev/null
		if [[ "$?" == 0 ]]; then
			@logshowpassed "[httpd] has been installed successfully using [brew]\n"
		else
			@logshowpassed "[httpd] has been installed unsuccessfully using [brew]\n"
		fi
	fi
elif [[ "${AP_OS_TYPE}" == "${AP_OS_TYPE_UBUNTU}" ]]; then
	@logshow "Installing [Apache2] using apt\n"

	sudo apt update
	sudo apt install -y apache2
	sudo a2enmod proxy

	if type apache2ctl &>/dev/null; then
		@logshowpassed "[Apache 2] has been installed successfully using [apt]\n"
	else
		@logshowpassed "[Apache 2] has been installed unsuccessfully using [apt]\n"
	fi
fi
