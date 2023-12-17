if type rg &>/dev/null; then
	@logshow "Removing [ripgrep]\n"

	rm -rf "${AP_VENDORS_RIPGREP_DIR}"
	rm -f "${RIPGREP_CONFIG_PATH}"
	rm -f "${AP_MAN_DIR}/man1/rg.1"

	if [ ! -d "${AP_VENDORS_RIPGREP_DIR}" ]; then
		@logshowpassed "[ripgrep] has been removed successfully\n"
	else
		@logshowfailed "[ripgrep] has been removed unsuccessfully\n"
	fi
fi
