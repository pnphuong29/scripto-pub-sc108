# https://github.com/ogham/exa
# https://pandoc.org
# https://github.com/rust-lang/git2-rs
# https://github.com/casey/just
# Dependencies: ghq, just (rust), pandoc, libgit2 (rust), git-delta (rust)

export AP_VENDORS_RUST_EXA_SETUP_DIR="${AP_SCRIPTO_COMMON_DIR}/vendors/rust-exa"
export AP_VENDORS_RUST_EXA_SETUP_CONFIGS_DIR="${AP_VENDORS_RUST_EXA_SETUP_DIR}/configs"
export AP_VENDORS_EXA_REPO_URL="https://github.com/ogham/exa"
export AP_VENDORS_EXA_GH_DIR="${AP_GH_DIR}/ogham/exa"

if type exa &>/dev/null; then
	@logshow "Removing [exa]\n"

	if type cargo &>/dev/null; then
		ap_vendors_exa_dir="${AP_GH_DIR}/ogham/exa"
	else
		ap_vendors_exa_dir="${AP_SOFT_DIR}/exa"
	fi

	rm -f "${AP_MAN_DIR}/man1/exa.1"
	rm -f "${AP_MAN_DIR}/man5/exa_colors.5"
	rm -f "${AP_COMPLETIONS_DIR}/ap_completion_exa.bash"
	rm -rf "${ap_vendors_exa_dir}"
	sudo rm -f /usr/local/bin/exa

	if [[ ! -d "${ap_vendors_exa_dir}" ]]; then
		@logshowpassed "[exa] has been removed successfully\n"
	else
		@logshowfailed "[exa] has been removed unsuccessfully\n"
	fi
fi
