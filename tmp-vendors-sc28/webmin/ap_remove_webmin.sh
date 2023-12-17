if type webmin &>/dev/null; then
	if [[ "${AP_OS_TYPE}" == "${AP_OS_TYPE_UBUNTU}" ]]; then
		@logshow "Removing [webmin] using [apt]\n"
		sudo apt purge -y webmin
		sudo apt autoremove -y
	fi

	if ! type webmin &>/dev/null; then
		@logshowpassed "[webmin] has been removed successfully\n"
	else
		@logshowfailed "[webmin] has been removed unsuccessfully\n"
	fi
fi
