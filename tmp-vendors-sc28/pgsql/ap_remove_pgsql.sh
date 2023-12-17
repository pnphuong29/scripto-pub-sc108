if type psql &>/dev/null; then
	if [[ "${AP_OS_TYPE}" == "${AP_OS_TYPE_MACOS}" ]]; then
		@logshow "Removing [PostgreSQL] using [brew]\n"
		brew uninstall postgresql
	elif [[ "${AP_OS_TYPE}" == "${AP_OS_TYPE_UBUNTU}" ]]; then
		@logshow "Removing [PostgreSQL] using [apt]\n"
		ap_pgsql_major_version="$(psql --version | cut -d ' ' -f 3 | cut -d . -f 1)"
		sudo apt remove -y postgresql "postgresql-server-dev-${ap_pgsql_major_version}"
	fi

	if ! type psql &>/dev/null; then
		@logshowpassed "[PostgreSQL] has been removed successfully\n"
	else
		@logshowfailed "[PostgreSQL] has been removed unsuccessfully\n"
	fi
fi
