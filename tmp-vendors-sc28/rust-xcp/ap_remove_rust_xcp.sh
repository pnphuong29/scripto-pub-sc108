# https://github.com/tarka/xcp#installation
# Dependencies: cargo

export AP_VENDORS_RUST_XCP_SETUP_DIR="${AP_SCRIPTO_COMMON_DIR}/vendors/rust-xcp"
export AP_VENDORS_RUST_XCP_SETUP_CONFIGS_DIR="${AP_VENDORS_RUST_XCP_SETUP_DIR}/configs"
export AP_VENDORS_RUST_XCP_REPO_URL="https://github.com/tarka/xcp"
export AP_VENDORS_RUST_XCP_GH_DIR="${AP_GH_DIR}/tarka/xcp"

if type xcp &>/dev/null; then
	@logshow "Removing [xcp] using [cargo]\n"

	cargo uninstall xcp
	sudo rm -f /usr/local/bin/xcp

	if ! type xcp &>/dev/null; then
		removs_write_show_log_msg_general_passed "[xcp] has been removed successfully using [cargo]\n"
	else
		removs_write_show_log_msg_general_failed "[xcp] has been removed unsuccessfully using [cargo]\n"
	fi
fi
