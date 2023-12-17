export AP_VENDORS_RUST_FD_SETUP_DIR="${AP_SCRIPTO_COMMON_DIR}/vendors/rust-fd"
export AP_VENDORS_RUST_FD_SETUP_CONFIGS_DIR="${AP_VENDORS_RUST_FD_SETUP_DIR}/configs"
export AP_VENDORS_RUST_FD_DIR="${AP_GH_DIR}/${AP_VENDORS_FD_REPO_NAME}"

if type fd &>/dev/null; then
	@minfo "Removing [fd]\n"

	# if type cargo &>/dev/null; then
	# 	export AP_VENDORS_RUST_FD_DIR="${AP_GH_DIR}/${AP_VENDORS_FD_REPO_NAME}"
	# else
	# 	export AP_VENDORS_RUST_FD_DIR="${AP_SOFT_DIR}/fd"
	# fi

	rm -rf "${AP_VENDORS_RUST_FD_DIR}"
	rm -rf "${HOME}/.config/fd"
	rm -f "${AP_MAN_DIR}/man1/fd.1"
	sudo rm -f /usr/local/bin/fd

	if [[ ! -f "${AP_VENDORS_RUST_FD_DIR}/target/release/fd" ]]; then
		@minfo "[fd] has been removed successfully\n"
	else
		@minfo "[fd] has been removed unsuccessfully\n"
	fi
fi
