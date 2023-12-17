if type docker &>/dev/null; then
	if [[ "${AP_OS_TYPE}" == "${AP_OS_TYPE_MACOS}" ]]; then
		@logshow "Removing [docker] using [brew]\n"

		brew remove --cask docker

		if ! type docker &>/dev/null; then
			@logshowpassed "[docker] has been removed successfully using [brew]\n"
		else
			@logshowfailed "[docker] has been removed unsuccessfully using [brew]\n"
		fi
	else
		@logshow "Removing [docker] using [apt]\n"

		sudo apt-get purge docker-ce docker-ce-cli containerd.io
		sudo rm -rf /var/lib/docker
		sudo rm -rf /var/lib/containerd

		if ! type docker &>/dev/null; then
			@logshowpassed "[docker] has been removed successfully using [apt]\n"
		else
			@logshowfailed "[docker] has been removed unsuccessfully using [apt]\n"
		fi
	fi
fi
