# https://linux.die.net/man/1/xbindkeys

export AP_VENDORS_XBINDKEYS_SETUP_DIR="${AP_SCRIPTO_COMMON_DIR}/vendors/xbindkeys"
export AP_VENDORS_XBINDKEYS_SETUP_CONFIGS_DIR="${AP_VENDORS_XBINDKEYS_SETUP_DIR}/configs"

if ! type xbindkeys &>/dev/null; then
	@logshow "Installing [xbindkeys, xautomation, xdotool]\n"

	# Install xbindkeys
	sudo apt update
	sudo apt install -y xbindkeys xautomation xdotool
	# xbindkeys_autostart

	if type xbindkeys &>/dev/null; then
		@logshowpassed "[xbindkeys] has been installed successfully\n"
	else
		@logshowfailed "[xbindkeys] has been installed unsuccessfully\n"
	fi
fi
