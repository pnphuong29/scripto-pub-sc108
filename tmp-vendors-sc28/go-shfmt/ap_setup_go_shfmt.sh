# https://github.com/mvdan/sh
# Dependencies: go

if ! type shfmt &>/dev/null; then
	if ! type go &>/dev/null; then
		@logshow "Cannot find [go] to install [shfmt]\n"
	else
		@logshow "Installing [shfmt]\n"

		go install mvdan.cc/sh/v3/cmd/shfmt@latest

		if type shfmt &>/dev/null; then
			@logshowpassed "[shfmt] has been installed successfully\n"
		else
			@logshowfailed "[shfmt] has been installed unsuccessfully\n"
		fi

		@logshow "Installing [gosh]\n"

		go install mvdan.cc/sh/v3/cmd/gosh@latest

		if type gosh &>/dev/null; then
			@logshowpassed "[gosh] has been installed successfully\n"
		else
			@logshowfailed "[gosh] has been installed unsuccessfully\n"
		fi
	fi
fi
