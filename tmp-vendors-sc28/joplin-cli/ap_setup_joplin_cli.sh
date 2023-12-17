# https://joplinapp.org/terminal/

export AP_VENDORS_JOPLIN_CLI_SETUP_DIR="${AP_SCRIPTO_COMMON_DIR}/vendors/joplin-cli"

if ! type joplin &>/dev/null; then
	@logshow "Installing [joplin cli] using [npm]\n"
	npm -g install joplin

	if type joplin &>/dev/null; then
		@logshow "Installed [joplin cli] successfully using [npm]\n"
	else
		@logshow "Installed [joplin cli] unsuccessfully using [npm]\n"
	fi
fi
