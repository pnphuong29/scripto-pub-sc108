# https://www.virtualbox.org/wiki/Downloads

export AP_VENDORS_VBOX_SETUP_DIR="${AP_SCRIPTO_COMMON_DIR}/vendors/vbox"
export AP_VENDORS_VBOX_SETUP_CONFIGS_DIR="${AP_VENDORS_VBOX_SETUP_DIR}/configs"

if type VBoxManage &>/dev/null; then
	if [[ "${AP_OS_TYPE}" == "${AP_OS_TYPE_MACOS}" ]]; then
		@logshow "Removing [VirtualBox] using [brew]\n"
		brew uninstall virtualbox virtualbox-extension-pack
	elif [[ "${AP_OS_TYPE}" == "${AP_OS_TYPE_UBUNTU}" ]]; then
		@logshow "Removing [VirtualBox] using [apt]\n"
		sudo apt update
		sudo apt remove -y virtualbox
	fi

	if ! type VBoxManage &>/dev/null; then
		@logshowpassed "[VirtualBox] has been removed successfully\n"
	else
		@logshowfailed "[VirtualBox] has been removed unsuccessfully\n"
	fi
fi
