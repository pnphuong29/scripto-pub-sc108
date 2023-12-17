export AP_VENDORS_XBINDKEYS_SETUP_DIR="${AP_SCRIPTO_COMMON_DIR}/vendors/xbindkeys"
export AP_VENDORS_XBINDKEYS_SETUP_CONFIGS_DIR="${AP_VENDORS_XBINDKEYS_SETUP_DIR}/configs"

if type xbindkeys &>/dev/null; then
	@logshow "Removing [xbindkeys]\n"

	# Remove xbindkeys
	sudo apt purge -y xbindkeys xautomation xdotool
	sudo apt autoremove -y
	rm -f ~/.xbindkeysrc

	if type xbindkeys; then
		@logshowpassed "[xbindkeys] has been removed successfully\n"
	else
		@logshowfailed "[xbindkeys] has been removed unsuccessfully\n"
	fi
fi
