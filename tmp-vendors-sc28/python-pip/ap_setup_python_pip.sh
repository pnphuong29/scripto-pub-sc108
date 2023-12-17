# https://pip.pypa.io/en/stable/installation/
# Dependencies: python3

if ! type pip3 &>/dev/null; then
	if [[ "${AP_OS_TYPE}" == "${AP_OS_TYPE_UBUNTU}" ]]; then
		@logshow "Installing [pip3]\n"
		sudo apt update
		sudo apt install -y python3-pip
		python3 -m pip install --upgrade pip
		if type pip3 &>/dev/null; then
			@logshowpassed "[pip3] has been installed successfully\n"
		else
			@logshowfailed "[pip3] has been installed unsuccessfully\n"
		fi
	fi
fi
