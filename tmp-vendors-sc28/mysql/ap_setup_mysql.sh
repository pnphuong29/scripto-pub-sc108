# MySQL should have only 1 version in current system

export AP_VENDORS_MYSQL_SETUP_DIR="${AP_SCRIPTO_COMMON_DIR}/vendors/mysql"

if [[ "${AP_OS_TYPE}" == "${AP_OS_TYPE_MACOS}" ]]; then
	export AP_MYSQL_DATA_DIR_DEFAULT='/usr/local/var/mysql'
elif [[ "${AP_OS_TYPE}" == "${AP_OS_TYPE_UBUNTU}" ]]; then
	export AP_MYSQL_DATA_DIR_DEFAULT='/var/lib/mysql'
fi

if [[ "${AP_OS_TYPE}" == "${AP_OS_TYPE_MACOS}" ]]; then
	brew list --version | grep mysql &>/dev/null
	if [[ "$?" != 0 ]]; then
		# Remove old mysqld directories
		@logshow "Remove old directories of mysql server\n"
		rm -rf "${AP_MYSQL_DATA_DIR_DEFAULT}"*
		rm -rf /usr/local/opt/mysql # basedir of mysql in homebrew

		# Install mysql server
		@logshow "Installing [MySQL] using [brew]\n"
		brew install mysql

		if type mysql &>/dev/null; then
			@logshowpassed "[MySQL] has been installed successfully\n"

			# Initialize mysql server
			@logshow "Initialize [MySQL] using [mysql_secure_installation]\n"
			brew services start mysql # register mysql as a service and will be launched at startup
			# mysql_secure_installation
		else
			@logshowfailed "[MySQL] has been installed unsuccessfully\n"
		fi
	fi
elif [[ "${AP_OS_TYPE}" == "${AP_OS_TYPE_UBUNTU}" ]]; then
	if ! type mysql &>/dev/null; then
		# Remove old mysqld directories
		@logshow "Remove old directories of mysql server\n"
		sudo rm -rf "${AP_MYSQL_DATA_DIR_DEFAULT}"*

		# Install mysql server
		@logshow "Installing [MySQL] using [apt]\n"
		sudo apt update
		sudo apt install -y mysql-server

		if type mysql &>/dev/null; then
			@logshowpassed "[MySQL] has been installed successfully\n"

			# Initialize mysql server
			# @logshow "Initialize [MySQL] using [mysql_secure_installation]\n"
			# sudo mysql_secure_installation
		else
			@logshowfailed "[MySQL] has been installed unsuccessfully\n"
		fi
	fi
fi
