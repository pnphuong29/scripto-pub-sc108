if type fzf &>/dev/null; then
	@logshow "Removing [fzf]\n"

	ap_vendors_fzf_dir="${HOME}/.fzf"
	rm -rf "${ap_vendors_fzf_dir}"

	# Unbind keys
	bind -r "\C-b" # Chrome bookmarks
	bind -r "\C-h" # Chrome history

	if [[ ! -d "${ap_vendors_fzf_dir}" ]]; then
		@logshowpassed "[fzf] has been removed successfully\n"
	else
		@logshowfailed "[fzf] has been removed unsuccessfully\n"
	fi
fi
