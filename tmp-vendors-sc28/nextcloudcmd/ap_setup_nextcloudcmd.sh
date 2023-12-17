# https://docs.nextcloud.com/desktop/latest/advancedusage.html#install-nextcloudcmd

if ! type nextcloudcmd; then
	if [[ "${AP_OS_TYPE}" == "${AP_OS_TYPE_UBUNTU}" ]]; then
		@logshow "Installing [nextcloudcmd] using [apt]\n"

		sudo add-apt-repository -y ppa:nextcloud-devs/client
		sudo apt update
		sudo apt install -y nextcloud-client

		if type nextcloudcmd; then
			@logshow "Installed [nextcloudcmd] successfully using [apt]\n"
		else
			@logshow "Installed [nextcloudcmd] unsuccessfully using [apt]\n"
		fi
	fi
fi
