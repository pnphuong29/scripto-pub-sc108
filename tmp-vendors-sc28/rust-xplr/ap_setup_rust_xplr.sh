# https://github.com/sayanarijit/xplr

if ! type xplr &>/dev/null; then
	if [[ "${AP_OS_TYPE}" == "${AP_OS_TYPE_MACOS}" ]]; then
		@logshow "Installing [xplr] using [brew]\n"

		brew install xplr

		if brew list --versions | grep xplr &>/dev/null; then
			@logshowpassed "[xplr] has been installed successfully using [brew]\n"
		else
			@logshowfailed "[xplr] has been installed unsuccessfully using [brew]\n"
		fi
	else
		@logshow "Installing [xplr] using [binary package]\n"

		cd "${AP_TMP_DIR}"
		wget https://github.com/sayanarijit/xplr/releases/latest/download/xplr-linux.tar.gz
		tar -zxf xplr-linux.tar.gz
		mv xplr "${AP_SOFT_DIR}/bin/"
		rm -f xplr-linux.tar.gz

		if type xplr &>/dev/null; then
			@logshowpassed "[xplr] has been installed successfully using [binary package]\n"
		else
			@logshowfailed "[xplr] has been installed unsuccessfully using [binary package]\n"
		fi
	fi
fi
