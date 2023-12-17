# MySQL should have only 1 version in current system

if [[ "${AP_OS_TYPE}" == "${AP_OS_TYPE_MACOS}" ]]; then
	export AP_MYSQL_DATA_DIR_DEFAULT='/usr/local/var/mysql'
elif [[ "${AP_OS_TYPE}" == "${AP_OS_TYPE_UBUNTU}" ]]; then
	export AP_MYSQL_DATA_DIR_DEFAULT='/var/lib/mysql'
fi

if [[ "${AP_OS_TYPE}" == "${AP_OS_TYPE_MACOS}" ]]; then
	brew list --version | grep mysql &>/dev/null
	if [[ "$?" == 0 ]]; then
		@logshow "Removing [MySQL] using [brew]\n"
		brew uninstall mysql

		# Remove old mysqld directories
		@logshow "Remove old directories of mysql server\n"
		rm -rf "${AP_MYSQL_DATA_DIR_DEFAULT}"*
		rm -rf /usr/local/opt/mysql

		brew list --version | grep mysql &>/dev/null
		if [[ "$?" != 0 ]]; then
			@logshowpassed "[MySQL] has been removed successfully\n"
		else
			@logshowfailed "[MySQL] has been removed unsuccessfully\n"
		fi
	fi
elif [[ "${AP_OS_TYPE}" == "${AP_OS_TYPE_UBUNTU}" ]]; then
	if type mysql &>/dev/null; then
		@logshow "Removing [MySQL] using [apt]\n"
		sudo apt purge -y mysql-server mysql-client
		sudo apt autoremove -y

		# Remove old mysqld directories
		@logshow "Remove old directories of mysql server\n"
		sudo rm -rf "${AP_MYSQL_DATA_DIR_DEFAULT}"*

		if [[ ! -f /usr/bin/mysqld ]]; then
			@logshowpassed "[MySQL] has been removed successfully\n"
		else
			@logshowfailed "[MySQL] has been removed unsuccessfully\n"
		fi

	fi
fi
