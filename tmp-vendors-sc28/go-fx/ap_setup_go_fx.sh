# https://github.com/antonmedv/fx
# https://github.com/antonmedv/fx-completion
# Dependencies: nodejs, npm

if ! type fx &>/dev/null; then
	@logshowpassed "Installing [fx]\n"
	go install github.com/antonmedv/fx@latest
	# npm install --global fx fx-completion
	npm install --global fx-completion

	if type fx &>/dev/null; then
		@logshowpassed "Install [fx] has been installed successfully\n"
	else
		@logshowfailed "Install [fx] has been installed unsuccessfully\n"
	fi

	if type fx-completion &>/dev/null; then
		@logshowpassed "Install [fx-completion] has been installed successfully\n"
	else
		@logshowfailed "Install [fx-completion] has been installed unsuccessfully\n"
	fi
fi
