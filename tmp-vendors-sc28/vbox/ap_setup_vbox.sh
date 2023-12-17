# https://www.virtualbox.org/wiki/Downloads

export AP_VENDORS_VBOX_SETUP_DIR="${AP_SCRIPTO_COMMON_DIR}/vendors/vbox"
export AP_VENDORS_VBOX_SETUP_CONFIGS_DIR="${AP_VENDORS_VBOX_SETUP_DIR}/configs"

if ! type VBoxManage &>/dev/null; then
	if [[ "${AP_OS_TYPE}" == "${AP_OS_TYPE_MACOS}" ]]; then
		@logshow "Installing [VirtualBox] using [brew]\n"
		brew install virtualbox virtualbox-extension-pack
	elif [[ "${AP_OS_TYPE}" == "${AP_OS_TYPE_UBUNTU}" ]]; then
		@logshow "Installing [VirtualBox] using [apt]\n"
		sudo apt update
		sudo apt install -y virtualbox
	fi

	# Verify if installation is successful or not
	if type VBoxManage &>/dev/null; then
		@logshowpassed "[VirtualBox] has been installed successfully\n"

		# Autocomplete
		@logshow "Installing virtualbox [VBoxManage] bash completion\n"
		curl -L https://raw.githubusercontent.com/gryf/vboxmanage-bash-completion/master/VBoxManage -o "${AP_COMPLETIONS_DIR}/ap_completion_vboxmanage.bash"
		grep "complete -o default -F _VBoxManage vbm" "${AP_COMPLETIONS_DIR}/ap_completion_vboxmanage.bash" &>/dev/null
		if [[ "$?" != 0 ]]; then
			echo >>"${AP_COMPLETIONS_DIR}/ap_completion_vboxmanage.bash"
			echo "complete -o default -F _VBoxManage vbm # vbm is an alias of VBoxManage" >>"${AP_COMPLETIONS_DIR}/ap_completion_vboxmanage.bash"
		fi
	else
		@logshowfailed "[VirtualBox] has been installed unsuccessfully\n"
	fi
fi
