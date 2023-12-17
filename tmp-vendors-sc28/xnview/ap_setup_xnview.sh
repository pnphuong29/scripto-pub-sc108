# https://www.xnview.com/en/xnviewmp/#downloads

export AP_VENDORS_XNVIEW_SETUP_DIR="${AP_SCRIPTO_COMMON_DIR}/vendors/xnview"

if ! type xnview &>/dev/null; then
	@logshow "Installing [xnview]\n"

	# Install xnview
	if [[ "${AP_OS_TYPE}" == "${AP_OS_TYPE_MACOS}" ]]; then
		brew install --cask xnviewmp xnconvert

		if brew list --versions | grep xnviewmp &>/dev/null; then
			@logshowpassed "[xnviewmp] has been installed successfully\n"
		else
			@logshowfailed "[xnviewmp] has been installed unsuccessfully\n"
		fi

		if brew list --versions | grep xnconvert &>/dev/null; then
			@logshowpassed "[xnconvert] has been installed successfully\n"
		else
			@logshowfailed "[xnconvert] has been installed unsuccessfully\n"
		fi
	elif [[ "${AP_OS_TYPE}" == "${AP_OS_TYPE_UBUNTU}" ]]; then
		cd "${AP_TMP_DIR}"

		curl -SOL "https://download.xnview.com/XnViewMP-linux-x64.deb"
		sudo apt install -y libgdk-pixbuf2.0-0 libopenal1
		sudo dpkg -i XnViewMP-linux-x64.deb

		curl -SOL "https://download.xnview.com/XnConvert-linux-x64.deb"
		sudo dpkg -i XnConvert-linux-x64.deb

		if type xnview &>/dev/null; then
			@logshowpassed "[xnview] has been installed successfully\n"
		else
			@logshowfailed "[xnview] has been installed unsuccessfully\n"
		fi

		if type xnconvert &>/dev/null; then
			@logshowpassed "[xnconvert] has been installed successfully\n"
		else
			@logshowfailed "[xnconvert] has been installed unsuccessfully\n"
		fi
	fi
fi
