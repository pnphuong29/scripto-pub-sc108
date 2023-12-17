# https://github.com/ranger/ranger

if ! type ranger &>/dev/null; then
	if type pip3 &>/dev/null; then
		@logshow "Installing [python-ranger]\n"

		pip3 install ranger-fm

		if type ranger &>/dev/null; then
			@logshowpassed "[python-ranger] has been installed successfully\n"
		else
			@logshowfailed "[python-ranger] has been installed unsuccessfully\n"
		fi
	fi
fi
