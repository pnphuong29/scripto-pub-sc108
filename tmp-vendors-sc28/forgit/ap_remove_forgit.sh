if type forgit &>/dev/null; then
	@logshow "Removing [forgit]\n"

	ap_forgit_install_dir="${AP_GH_DIR}/wfxr/forgit"
	rm -rf "${ap_forgit_install_dir}"

	if [[ ! -d "${ap_forgit_install_dir}" ]]; then
		@logshowpassed "[forgit] has been removed successfully\n"
	else
		@logshowfailed "[forgit] has been removed unsuccessfully\n"
	fi
fi
