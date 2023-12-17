# https://docs.nextcloud.com/desktop/latest/advancedusage.html#install-nextcloudcmd

if type nextcloudcmd; then
	if [[ "${AP_OS_TYPE}" == "${AP_OS_TYPE_UBUNTU}" ]]; then
		@logshow "Removing [nextcloudcmd] using [apt]\n"

		sudo add-apt-repository --yes --remove ppa:nextcloud-devs/client
		sudo apt purge -y nextcloud-client
		sudo apt autoremove -y

		if ! type nextcloudcmd; then
			@logshow "Removed [nextcloudcmd] successfully using [apt]\n"
		else
			@logshow "Removed [nextcloudcmd] unsuccessfully using [apt]\n"
		fi
	fi
fi
