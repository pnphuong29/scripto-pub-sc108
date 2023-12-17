if type batman &>/dev/null; then
	@logshow "Removing [bat-extras]\n"

	ap_vendors_bat_extras_dir="${AP_GH_DIR}/eth-p/bat-extras"
	rm -rf "${ap_vendors_bat_extras_dir}"

	if [[ ! -d "${ap_vendors_bat_extras_dir}" ]]; then
		@logshowpassed "[bat-extras] has been removed successfully\n"
	else
		@logshowfailed "[bat-extras] has been removed unsuccessfully\n"
	fi
fi
