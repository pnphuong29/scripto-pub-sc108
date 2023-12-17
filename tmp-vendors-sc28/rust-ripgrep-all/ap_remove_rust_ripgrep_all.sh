if type rga &>/dev/null; then
	@logshow "Removing [ripgrep-all]"

	if type cargo &>/dev/null; then
		ap_vendors_ripgrep_all_dir="${AP_GH_DIR}/${AP_VENDORS_RIPGREP_ALL_REPO_PATH}"
	else
		ap_vendors_ripgrep_all_dir="${AP_SOFT_DIR}/ripgrep-all"
	fi

	rm -rf "${ap_vendors_ripgrep_all_dir}"
	! type rga &>/dev/null && @logshow "Remove [ripgrep-all] successfully"
fi
