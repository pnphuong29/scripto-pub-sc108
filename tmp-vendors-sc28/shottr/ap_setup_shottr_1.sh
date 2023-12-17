# https://shottr.cc/

export AP_VENDORS_SHOTTR_SETUP_DIR="${AP_SCRIPTO_COMMON_DIR}/vendors/shottr"

if ! type shottr &>/dev/null; then
	if [[ "${AP_OS_TYPE}" == "${AP_OS_TYPE_MACOS}" ]]; then
		@logshow "Installing [shottr]\n"

		cd "${AP_DL_DIR}"
		wget https://shottr.cc/dl/Shottr-1.6.1.dmg
		sudo hdiutil attach Shottr-1.6.1.dmg
		sudo installer -package /Volumes/Shottr-1.6.1/Shottr-1.6.1.pkg -target /
		sudo hdiutil detach /Volumes/Shottr-1.6.1

		if brew list --versions | grep shottr &>/dev/null; then
			@logshowpassed "[shottr] has been installed successfully\n"
		else
			@logshowfailed "[shottr] has been installed unsuccessfully\n"
		fi
	fi
fi
