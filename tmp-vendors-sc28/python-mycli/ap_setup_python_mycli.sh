# https://github.com/dbcli/mycli
# Dependencies: libpg (postgresql-server-dev-14)

if ! type mycli &>/dev/null; then
	if type python3 &>/dev/null; then
		@logshow "Installing [mycli]\n"

		pip3 install mycli

		if type mycli &>/dev/null; then
			@logshowpassed "[mycli] has been installed successfully\n"
		else
			@logshowfailed "[mycli] has been installed unsuccessfully\n"
		fi
	fi
fi
