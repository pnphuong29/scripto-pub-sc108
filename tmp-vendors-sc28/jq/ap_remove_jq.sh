# https://github.com/stedolan/jq

if type jq &>/dev/null; then
	@logshow "Removing [jq]\n"

	# Remove jq
	rm -f "${AP_SOFT_DIR}/bin/jq"

	if ! type jq; then
		@logshowpassed "[jq] has been removed successfully\n"
	else
		@logshowfailed "[jq] has been removed unsuccessfully\n"
	fi
fi
