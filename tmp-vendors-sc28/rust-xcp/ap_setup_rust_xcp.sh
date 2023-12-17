# https://github.com/tarka/xcp#installation
# Dependencies: cargo

export AP_VENDORS_RUST_XCP_SETUP_DIR="${AP_SCRIPTO_COMMON_DIR}/vendors/rust-xcp"
export AP_VENDORS_RUST_XCP_SETUP_CONFIGS_DIR="${AP_VENDORS_RUST_XCP_SETUP_DIR}/configs"
export AP_VENDORS_RUST_XCP_REPO_URL="https://github.com/tarka/xcp"
export AP_VENDORS_RUST_XCP_GH_DIR="${AP_GH_DIR}/tarka/xcp"

if ! type xcp &>/dev/null; then
	@logshow "Installing [xcp] using [cargo]\n"

	cargo install xcp
	sudo ln -sf ~/.cargo/bin/xcp /usr/local/bin/xcp

	if type xcp &>/dev/null; then
		@logshowpassed "[xcp] has been installed successfully using [cargo]\n"
	else
		@logshowfailed "[xcp] has been installed unsuccessfully using [cargo]\n"
	fi
fi
