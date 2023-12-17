# https://github.com/charmbracelet/glow#installation

export AP_VENDORS_GLOW_SETUP_DIR="${AP_SCRIPTO_COMMON_DIR}/vendors/glow"

if ! type glow &>/dev/null; then
	if [[ "${AP_OS_TYPE}" == "${AP_OS_TYPE_MACOS}" ]]; then
		@logshow "Installing [glow] using [brew]\n"
		brew install glow

		if brew list --versions | grep glow &>/dev/null; then
			@logshowpassed "[glow] has been installed successfully using [brew]\n"
		else
			@logshowfailed "[glow] has been installed unsuccessfully using [brew]\n"
		fi
	elif [[ "${AP_OS_TYPE}" == "${AP_OS_TYPE_UBUNTU}" ]]; then
		@logshow "Installing [glow] using [apt]\n"

		sudo mkdir -p /etc/apt/keyrings
		curl -fsSL https://repo.charm.sh/apt/gpg.key | sudo gpg --dearmor -o /etc/apt/keyrings/charm.gpg
		echo "deb [signed-by=/etc/apt/keyrings/charm.gpg] https://repo.charm.sh/apt/ * *" | sudo tee /etc/apt/sources.list.d/charm.list
		sudo apt update
		sudo apt install -y glow

		if type glow &>/dev/null; then
			@logshowpassed "[glow] has been installed successfully using [apt]\n"
		else
			@logshowfailed "[glow] has been installed unsuccessfully using [apt]\n"
		fi
	fi
fi
