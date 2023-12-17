# https://github.com/jez/as-tree

if type as-tree &>/dev/null; then
	@logshow "Uninstalling [as-tree] using [cargo]\n"
	cargo uninstall as-tree

	if ! type as-tree &>/dev/null; then
		@logshowpassed "[as-tree] has been uninstalled successfully\n"
	else
		@logshowfailed "[as-tree] has been uninstalled unsuccessfully\n"
	fi
fi
