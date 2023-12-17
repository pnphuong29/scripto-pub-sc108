# https://github.com/mvdan/sh
# Dependencies: go

if ! type shfmt &>/dev/null; then
	ap_gopath="$(go env GOPATH)"

	if [[ -d "${ap_gopath}/pkg/mod/mvdan.cc" ]]; then
		@logshow "Removing [shfmt] & [gosh]\n"

		#@!warning ## this may remove other packages from the same parent module mvdan.cc
		rm -rf "${ap_gopath}/pkg/mod/mvdan.cc"
		rm -f "${ap_gopath}/bin/shfmt"
		rm -f "${ap_gopath}/bin/gosh"

		if type shfmt &>/dev/null; then
			@logshowpassed "[shfmt] has been removed successfully\n"
		else
			@logshowfailed "[shfmt] has been removed unsuccessfully\n"
		fi

		if type gosh &>/dev/null; then
			@logshowpassed "[gosh] has been removed successfully\n"
		else
			@logshowfailed "[gosh] has been removed unsuccessfully\n"
		fi
	fi
fi
