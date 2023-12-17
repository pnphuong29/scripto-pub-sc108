# https://rust-analyzer.github.io/manual.html#rust-analyzer-language-server-binary
# https://rust-analyzer.github.io/manual.html#installation

export AP_VENDORS_RUST_ANALYZER_REPO_URL="https://github.com/rust-analyzer/rust-analyzer"

if ! type rust-analyzer &>/dev/null; then
	@logshow "Installing [rust-analyzer] from precomplied source codes\n"

	ap_os_type="unknown-linux-gnu"
	if [[ "${AP_OS_TYPE}" == "${AP_OS_TYPE_MACOS}" ]]; then
		ap_os_type="apple-darwin"
	fi

	curl -L "${AP_VENDORS_RUST_ANALYZER_REPO_URL}/releases/latest/download/rust-analyzer-x86_64-${ap_os_type}.gz" | gunzip -c - >"${AP_SOFT_DIR}/bin/rust-analyzer"
	chmod +x "${AP_SOFT_DIR}/bin/rust-analyzer"

	if type rust-analyzer &>/dev/null; then
		@logshowpassed "[rust-analyzer] has been installed successfully\n"
	else
		@logshowfailed "[rust-analyzer] has been installed unsuccessfully\n"
	fi
fi
