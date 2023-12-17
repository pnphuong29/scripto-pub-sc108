# https://pypa.github.io/pipx/docs/
# Dependencies: python3, pip3

if ! type pipx &>/dev/null; then
	if ! type python3 &>/dev/null; then
		@logshow "Cannot find [python3] command to install pipx\n"
	elif ! type pip3 &>/dev/null; then
		@logshow "Cannot find [pip3] command to install pipx\n"
	else
		@logshow "Installing [pipx]\n"
		python3 -m pip install --user pipx
		if type pipx &>/dev/null; then
			@logshowpassed "[pipx] has been installed successfully\n"
		else
			@logshowfailed "[pipx] has been installed unsuccessfully\n"
		fi
	fi
fi
