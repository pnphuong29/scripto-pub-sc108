if type composer &>/dev/null; then
	@logshow "Removing [composer]\n"
	rm -f "${AP_SOFT_DIR}/bin/composer"
	if ! type composer &>/dev/null; then
		@logshowpassed "[composer] has been removed successfully\n"
	else
		@logshowfailed "[composer] has been removed unsuccessfully\n"
	fi
fi
