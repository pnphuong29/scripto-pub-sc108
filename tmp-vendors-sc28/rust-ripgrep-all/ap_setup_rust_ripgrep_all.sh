# https://github.com/phiresky/ripgrep-all
# Dependencies: ghq, ripgrep, pandoc, poppler, tesseract, ffmpeg

export AP_VENDORS_RIPGREP_ALL_REPO_PATH="phiresky/ripgrep-all"
export AP_VENDORS_RIPGREP_ALL_REPO_URL="https://github.com/${AP_VENDORS_RIPGREP_ALL_REPO_PATH}"

if ! type rga &>/dev/null; then
	if type cargo &>/dev/null; then
		@logshow "Installing [ripgrep-all] from building source codes using [cargo]"
		export AP_VENDORS_RIPGREP_ALL_DIR="${AP_GH_DIR}/${AP_VENDORS_RIPGREP_ALL_REPO_PATH}"

		# Remove old app dir if any
		rm -rf "${AP_VENDORS_RIPGREP_ALL_DIR}"

		ghq get "${AP_VENDORS_RIPGREP_ALL_REPO_URL}.git"
		cd "${AP_VENDORS_RIPGREP_ALL_DIR}"
		cargo build --release
		@addpath "${AP_VENDORS_RIPGREP_ALL_DIR}/target/release"
	else
		@logshow "Installing [ripgrep-all] from precomplied source codes"
		export AP_VENDORS_RIPGREP_ALL_DIR="${AP_SOFT_DIR}/ripgrep-all"

		# Remove old app dir if any
		rm -rf "${AP_VENDORS_RIPGREP_ALL_DIR}"

		if [[ "${AP_OS_TYPE}" == "${AP_OS_TYPE_MACOS}" ]]; then
			ap_os_type="apple-darwin"
			# Install dependencies
			brew install pandoc poppler tesseract ffmpeg
		elif [[ "${AP_OS_TYPE}" == "${AP_OS_TYPE_UBUNTU}" ]]; then
			ap_os_type="unknown-linux-musl"
			# Install dependencies
			sudo apt update
			sudo apt install -y ripgrep pandoc poppler-utils ffmpeg
		fi

		curl -L "${AP_VENDORS_RIPGREP_ALL_REPO_URL}/releases/download/v0.9.6/{ripgrep_all-v0.9.6-x86_64-${ap_os_type}.tar.gz}" -o "${AP_TMP_DIR}/#1"
		rm -rf "${AP_SOFT_DIR}/ripgrep-all"
		tar -C "${AP_SOFT_DIR}" -zxf "${AP_TMP_DIR}/ripgrep_all-v0.9.6-x86_64-${ap_os_type}.tar.gz"
		mv "${AP_SOFT_DIR}/ripgrep_all-v0.9.6-x86_64-${ap_os_type}" "${AP_VENDORS_RIPGREP_ALL_DIR}"
		@addpath "${AP_VENDORS_RIPGREP_ALL_DIR}"
	fi

	type rga &>/dev/null && @logshow "Install [ripgrep-all] successfully"
fi
