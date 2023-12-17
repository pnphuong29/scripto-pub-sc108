# https://github.com/ranger/ranger

if type ranger &>/dev/null; then
	if type pip3 &>/dev/null; then
		@logshow "Removing [python-ranger]\n"

		pip3 uninstall ranger-fm
		rm -rf ~/.config/ranger

		# Unbind keys
		# bind -r "\C- " # Ctrl + Space

		if ! type ranger &>/dev/null; then
			@logshowpassed "[python-ranger] has been removed successfully\n"
		else
			@logshowfailed "[python-ranger] has been removed unsuccessfully\n"
		fi
	fi
fi
