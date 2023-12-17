# https://github.com/BurntSushi/ripgrep
# Dependencies: ghq, asciidoctor (for generating manpage)

export AP_VENDORS_RIPGREP_REPO_PATH="BurntSushi/ripgrep"
export AP_VENDORS_RIPGREP_REPO_URL="https://github.com/${AP_VENDORS_RIPGREP_REPO_PATH}"

if ! type rg &>/dev/null; then
	if type cargo &>/dev/null; then
		@logshow "Installing [ripgrep] from building source codes using [cargo]\n"
		export AP_VENDORS_RIPGREP_DIR="${AP_GH_DIR}/${AP_VENDORS_RIPGREP_REPO_PATH}"

		# Remove old app dir if any
		rm -rf "${AP_VENDORS_RIPGREP_DIR}"

		ghq get "${AP_VENDORS_RIPGREP_REPO_URL}.git"
		cd "${AP_VENDORS_RIPGREP_DIR}"
		cargo build --release
		@addpath "${AP_VENDORS_RIPGREP_DIR}/target/release"

		# Man page
		ln -sf "$(gfind ${AP_VENDORS_RIPGREP_DIR} -name 'rg.1' | grep release)" "${AP_MAN_DIR}/man1/rg.1"
	else
		@logshow "Installing [ripgrep] from precomplied source codes\n"
		export AP_VENDORS_RIPGREP_DIR="${AP_SOFT_DIR}/ripgrep"

		# Remove old app dir if any
		rm -rf "${AP_VENDORS_RIPGREP_DIR}"

		ap_os_type="unknown-linux-musl"
		if [[ "${AP_OS_TYPE}" == "${AP_OS_TYPE_MACOS}" ]]; then
			ap_os_type="apple-darwin"
		fi

		curl -L "${AP_VENDORS_RIPGREP_REPO_URL}/releases/download/13.0.0/{ripgrep-13.0.0-x86_64-${ap_os_type}.tar.gz}" -o "${AP_TMP_DIR}/#1"
		rm -rf "${AP_SOFT_DIR}/ripgrep"
		tar -C "${AP_SOFT_DIR}" -zxf "${AP_TMP_DIR}/ripgrep-13.0.0-x86_64-${ap_os_type}.tar.gz"
		mv "${AP_SOFT_DIR}/ripgrep-13.0.0-x86_64-${ap_os_type}" "${AP_VENDORS_RIPGREP_DIR}"
		@addpath "${AP_VENDORS_RIPGREP_DIR}"

		# Man page
		# ln -sf "${AP_VENDORS_RIPGREP_DIR}/rg.1" "${AP_MAN_DIR}/man1/rg.1"
		ln -sf "${AP_VENDORS_RIPGREP_DIR}/doc/rg.1" "${AP_MAN_DIR}/man1/rg.1"
	fi

	# Config
	# ln -sf "${AP_SCRIPTO_COMMON_DIR}/vendors/rust-ripgrep/ap_rust_ripgrep.conf" "${AP_CONFIGS_DIR}/ap_rust_ripgrep.conf"

	if type rg &>/dev/null; then
		@logshowpassed "[ripgrep] has been installed successfully\n"
	else
		@logshowfailed "[ripgrep] has been installed unsuccessfully\n"
	fi
fi
