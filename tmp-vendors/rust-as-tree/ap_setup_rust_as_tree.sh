# https://github.com/jez/as-tree

if ! type as-tree &>/dev/null; then
	@logshow "Installing [as-tree] using [cargo]\n"
	cargo install -f --git https://github.com/jez/as-tree

	if type as-tree &>/dev/null; then
		@logshowpassed "[as-tree] has been installed successfully\n"
	else
		@logshowfailed "[as-tree] has been installed unsuccessfully\n"
	fi
fi
