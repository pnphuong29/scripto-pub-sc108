if type zoxide &>/dev/null; then
	@logshow "Removing [zoxide]\n"

	rm -f ~/.local/bin/zoxide
	rm -rf ~/.config/ranger/plugins/zoxide

	if ! type zoxide &>/dev/null; then
		@logshowpassed "[zoxide] has been removed successfully\n"
	else
		@logshowfailed "[zoxide] has been removed unsuccessfully\n"
	fi
fi
