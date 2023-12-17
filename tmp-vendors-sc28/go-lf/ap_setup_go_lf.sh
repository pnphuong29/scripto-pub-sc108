# https://github.com/gokcehan/lf
# Dependencies: go

export AP_VENDORS_GO_LF_SETUP_DIR="${AP_SCRIPTO_COMMON_DIR}/vendors/go-lf"
export AP_VENDORS_GO_LF_SETUP_CONFIGS_DIR="${AP_VENDORS_GO_LF_SETUP_DIR}/configs"

if ! type lf &>/dev/null; then
	if type go &>/dev/null; then
		@logshow "Installing [lf] using [go]\n"
		env CGO_ENABLED=0 go install -ldflags="-s -w" github.com/gokcehan/lf@latest

		if type lf &>/dev/null; then
			@logshowpassed "[lf] has been installed successfully using [go]\n"
		else
			@logshowfailed "[lf] has been installed unsuccessfully using [go]\n"
		fi
	else
		@logshow "Cannot find [go] to install [lf]\n"
	fi
fi
