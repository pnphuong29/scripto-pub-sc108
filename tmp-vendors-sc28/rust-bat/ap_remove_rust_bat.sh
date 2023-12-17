if type bat &>/dev/null; then
	@logshow "Removing [bat]\n"

	ap_vendors_bat_dir="${AP_SOFT_DIR}/bat"
	rm -rf "${ap_vendors_bat_dir}"

	if ! type bat &>/dev/null; then
		@logshowpassed "[bat] has been removed successfully\n"
	else
		@logshowfailed "[bat] has been removed unsuccessfully\n"
	fi
fi
