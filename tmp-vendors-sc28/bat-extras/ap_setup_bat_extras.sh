# https://github.com/eth-p/bat-extras
# Dependencies: ghq, shfmt

export AP_VENDORS_BAT_EXTRAS_DIR="${AP_GH_DIR}/eth-p/bat-extras"
export AP_VENDORS_BAT_EXTRAS_REPO_URL="https://github.com/eth-p/bat-extras"

if ! type batman &>/dev/null; then
	if ! type shfmt &>/dev/null; then
		@logshow "Cannot find [shfmt] to install [bat-extras]\n"
	else
		@logshow "Installing [bat-extras]\n"

		# Remove old bat-extras if any
		rm -rf "${AP_VENDORS_BAT_EXTRAS_DIR}"

		ghq get "${AP_VENDORS_BAT_EXTRAS_REPO_URL}"
		cd "${AP_VENDORS_BAT_EXTRAS_DIR}"
		./build.sh

		@addpath "${AP_VENDORS_BAT_EXTRAS_DIR}/bin"

		if type batman &>/dev/null; then
			@logshowpassed "[bat-extras] has been installed successfully\n"
		else
			@logshowfailed "[bat-extras] has been installed unsuccessfully\n"
		fi
	fi
fi
