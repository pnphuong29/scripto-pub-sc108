# https://github.com/dbcli/pgcli
# Dependencies: libpg (postgresql-server-dev-14)

if ! type pgcli &>/dev/null; then
	if type python3 &>/dev/null; then
		@logshow "Installing [pgcli]\n"

		pip3 install "psycopg[binary,pool]"
		pip3 install pgcli

		if type pgcli &>/dev/null; then
			@logshowpassed "[pgcli] has been installed successfully\n"
		else
			@logshowfailed "[pgcli] has been installed unsuccessfully\n"
		fi
	fi
fi
