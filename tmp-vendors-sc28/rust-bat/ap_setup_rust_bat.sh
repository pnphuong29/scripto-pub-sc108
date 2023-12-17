# https://github.com/sharkdp/bat

# @@ap-todo $$ try installing [bat] by building source codes using cargo
if ! type bat &>/dev/null; then
	@logshow "Installing [bat]\n"

	ap_os_type="unknown-linux-musl"
	if [[ "${AP_OS_TYPE}" == "${AP_OS_TYPE_MACOS}" ]]; then
		ap_os_type="apple-darwin"
	fi

	export AP_VENDORS_BAT_DIR="${AP_SOFT_DIR}/bat"
	export AP_VENDORS_BAT_REPO_URL="https://github.com/sharkdp/bat"

	rm -rf "${AP_SOFT_DIR}/bat-v0.20.0-x86_64-{ap_os_type}"
	rm -rf "${AP_VENDORS_BAT_DIR}"

	cd "${AP_TMP_DIR}"
	curl -OL "${AP_VENDORS_BAT_REPO_URL}/releases/download/v0.20.0/bat-v0.20.0-x86_64-${ap_os_type}.tar.gz"
	tar -C "${AP_SOFT_DIR}" -zxf "bat-v0.20.0-x86_64-${ap_os_type}.tar.gz"
	mv "${AP_SOFT_DIR}/bat-v0.20.0-x86_64-${ap_os_type}" "${AP_VENDORS_BAT_DIR}"

	@addpath "${AP_VENDORS_BAT_DIR}"
	ln -sf "${AP_VENDORS_BAT_DIR}/bat.1" "${AP_MAN_DIR}/man1/bat.1"

	if type bat &>/dev/null; then
		@logshowpassed "[bat] has been installed successfully\n"
	else
		@logshowfailed "[bat] has been installed unsuccessfully\n"
	fi
fi
