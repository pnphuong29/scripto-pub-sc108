# https://www.postgresql.org/download/linux/
# https://www.postgresql.org/download/macosx/

if ! type psql &>/dev/null; then
	@logshow "Installing [PostgreSQL]\n"

	if [[ "${AP_OS_TYPE}" == "${AP_OS_TYPE_MACOS}" ]]; then
		brew install postgresql@15
	elif [[ "${AP_OS_TYPE}" == "${AP_OS_TYPE_UBUNTU}" ]]; then
		sudo sh -c 'echo "deb http://apt.postgresql.org/pub/repos/apt $(lsb_release -cs)-pgdg main" > /etc/apt/sources.list.d/pgdg.list'
		wget --quiet -O - https://www.postgresql.org/media/keys/ACCC4CF8.asc | sudo apt-key add -
		sudo apt update
		sudo apt install -y postgresql

		ap_pgsql_major_version="$(psql --version | cut -d ' ' -f 3 | cut -d . -f 1)"
		sudo apt install -y "postgresql-server-dev-${ap_pgsql_major_version}"
	fi

	if type psql &>/dev/null; then
		@logshowpassed "[PostgreSQL ${ap_pgsql_major_version}] has been installed successfully\n"
	else
		@logshowfailed "[PostgreSQL ${ap_pgsql_major_version}] has been installed unsuccessfully\n"
	fi
fi
