# https://github.com/sharkdp/fd
# Dependencies: ghq

export AP_VENDORS_RUST_FD_SETUP_DIR="${AP_SCRIPTO_COMMON_DIR}/vendors/rust-fd"
export AP_VENDORS_RUST_FD_SETUP_CONFIGS_DIR="${AP_VENDORS_RUST_FD_SETUP_DIR}/configs"
export AP_VENDORS_RUST_FD_REPO_NAME="sharkdp/fd"
export AP_VENDORS_RUST_FD_REPO_URL="https://github.com/${AP_VENDORS_RUST_FD_REPO_NAME}"
export AP_VENDORS_RUST_FD_DIR="${AP_GH_DIR}/${AP_VENDORS_RUST_FD_REPO_NAME}"

if [[ ! -f "${AP_VENDORS_RUST_FD_DIR}/target/release/fd" ]]; then
	# if type cargo &>/dev/null; then
	@logshow "Installing [fd] from building source codes using [cargo]\n"
	# export AP_VENDORS_RUST_FD_DIR="${AP_GH_DIR}/${AP_VENDORS_RUST_FD_REPO_NAME}"

	# Remove old fd dir if any
	rm -rf "${AP_VENDORS_RUST_FD_DIR}"

	# Install fd
	ghq get "${AP_VENDORS_RUST_FD_REPO_URL}.git"
	cd "${AP_VENDORS_RUST_FD_DIR}"
	cargo build --release

	@minfo "Create symlink from [/usr/local/bin/fd] to [${AP_VENDORS_RUST_FD_DIR}/target/release/fd]\n"
	sudo ln -sf "${AP_VENDORS_RUST_FD_DIR}/target/release/fd" /usr/local/bin/fd
	# @addpath "${AP_VENDORS_RUST_FD_DIR}/target/release"

	# Man page
	ln -sf "${AP_VENDORS_RUST_FD_DIR}/doc/fd.1" "${AP_MAN_DIR}/man1/fd.1"
	# else
	# 	@logshow "Installing [fd] from precomplied source codes\n"
	# 	export AP_VENDORS_RUST_FD_DIR="${AP_SOFT_DIR}/fd"

	# 	# Remove old fd dir if any
	# 	rm -rf "${AP_VENDORS_RUST_FD_DIR}"

	# 	# Install fd
	# 	ap_os_type="unknown-linux-musl"
	# 	if [[ "${AP_OS_TYPE}" == "${AP_OS_TYPE_MACOS}" ]]; then
	# 		ap_os_type="apple-darwin"
	# 	fi

	# 	curl -L "${AP_VENDORS_RUST_FD_REPO_URL}/releases/download/v8.3.2/{fd-v8.3.2-x86_64-${ap_os_type}.tar.gz}" -o "${AP_TMP_DIR}/#1"
	# 	rm -rf "${AP_VENDORS_RUST_FD_DIR}"
	# 	tar -C "${AP_SOFT_DIR}" -zxf "${AP_TMP_DIR}/fd-v8.3.2-x86_64-${ap_os_type}.tar.gz"
	# 	mv "${AP_VENDORS_RUST_FD_DIR}-v8.3.2-x86_64-${ap_os_type}" "${AP_VENDORS_RUST_FD_DIR}"

	# 	@addpath "${AP_VENDORS_RUST_FD_DIR}"

	# 	# Man page
	# 	ln -sf "${AP_VENDORS_RUST_FD_DIR}/fd.1" "${AP_MAN_DIR}/man1/fd.1"
	# fi

	if type fd &>/dev/null; then
		@logshowpassed "[fd] has been installed successfully\n"
	else
		@logshowfailed "[fd] has been installed unsuccessfully\n"
	fi
fi
