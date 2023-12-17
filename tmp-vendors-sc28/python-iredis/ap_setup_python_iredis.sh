# Dependencies: python3

if ! type iredis &>/dev/null; then
	if ! type python3 &>/dev/null; then
		@logshow "Cannot find [python3] to install [iredis]\n"
	else
		@logshow "Installing [iredis]\n"

		pip3 install --user iredis

		if type iredis &>/dev/null; then
			@logshowpassed "[iredis] has been installed successfully\n"
		else
			@logshowfailed "[iredis] has been installed unsuccessfully\n"
		fi
	fi
fi
