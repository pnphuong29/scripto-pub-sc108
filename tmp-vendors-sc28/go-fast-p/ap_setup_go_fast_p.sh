# https://github.com/bellecp/fast-p
# Dependencies: pdftotext, fzf, GNU grep, ag (the silver searcher)

export AP_VENDORS_FAST_P_DIR="${AP_SOFT_DIR}/fast-p"

# @@ap-todo ## try installing fast-p using go
if ! type ag &>/dev/null; then
	echo "Cannot find [ag (the silver searcher] command"
elif ! type fzf &>/dev/null; then
	echo "Cannot find [fzf] command"
else
	if ! type fast-p &>/dev/null; then
		@logshow "Installing [fast-p] using precompiled binary\n"

		ap_os_type="Linux"
		if [[ "${AP_OS_TYPE}" == "${AP_OS_TYPE_MACOS}" ]]; then
			ap_os_type="Darwin"
			brew install poppler
		elif [[ "${AP_OS_TYPE}" == "${AP_OS_TYPE_UBUNTU}" ]]; then
			sudo apt update
			sudo apt install -y poppler-utils
		fi

		curl -L "https://github.com/bellecp/fast-p/releases/download/v0.2.5/{fast-p_0.2.5_${ap_os_type}_x86_64.tar.gz}" -o "${AP_TMP_DIR}/#1"
		rm -rf "${AP_VENDORS_FAST_P_DIR}"
		mkdir -p "${AP_VENDORS_FAST_P_DIR}"
		tar -C "${AP_VENDORS_FAST_P_DIR}" -zxf "${AP_TMP_DIR}/fast-p_0.2.5_${ap_os_type}_x86_64.tar.gz"

		@addpath "${AP_VENDORS_FAST_P_DIR}"

		if type fast-p &>/dev/null; then
			@logshowpassed "[fast-p] has been installed successfully\n"
		else
			@logshowfailed "[fast-p] has been installed unsuccessfully\n"
		fi
	fi
fi
