# https://github.com/stedolan/jq

export AP_VENDORS_JQ_SETUP_DIR="${AP_SCRIPTO_COMMON_DIR}/vendors/jq"
export AP_VENDORS_JQ_REPO_URL='https://github.com/stedolan/jq.git'

if ! type jq &>/dev/null; then
	@logshow "Installing [jq]\n"

	# Install jq
	if [[ "${AP_OS_TYPE}" == "${AP_OS_TYPE_MACOS}" ]]; then
		brew install jq
		# curl -SL "https://github.com/stedolan/jq/releases/download/jq-1.6/jq-osx-amd64" >"${AP_SOFT_DIR}/bin/jq"
	elif [[ "${AP_OS_TYPE}" == "${AP_OS_TYPE_UBUNTU}" ]]; then
		curl -SL "https://github.com/stedolan/jq/releases/download/jq-1.6/jq-linux64" >"${AP_SOFT_DIR}/bin/jq"
		chmod +x "${AP_SOFT_DIR}/bin/jq"
	fi

	# chmod +x "${AP_SOFT_DIR}/bin/jq"

	if type jq &>/dev/null; then
		@logshowpassed "[jq] has been installed successfully\n"
	else
		@logshowfailed "[jq] has been installed unsuccessfully\n"
	fi
fi
