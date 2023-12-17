if type rustup &>/dev/null; then
	@logshow "Removing [rust]\n"

	rustup self uninstall

	if ! type rustup &>/dev/null; then
		@logshowpassed "[rust] has been removed successfully\n"
	else
		@logshowfailed "[rust] has been removed unsuccessfully\n"
	fi
fi
