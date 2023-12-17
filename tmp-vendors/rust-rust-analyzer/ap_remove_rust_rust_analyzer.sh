if type rust-analyzer &>/dev/null; then
	@logshow "Removing [rust-analyzer]\n"

	rm -f "${AP_SOFT_DIR}/bin/rust-analyzer"

	if ! type rust-analyzer &>/dev/null; then
		@logshowpassed "[rust-analyzer] has been removed successfully\n"
	else
		@logshowfailed "[rust-analyzer] has been removed unsuccessfully\n"
	fi
fi
