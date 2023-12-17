# https://github.com/gokcehan/lf

if type lf &>/dev/null; then
	@logshow "Removing [lf]\n"
	rm -f /home/albert/go/bin/lf

	if ! type lf &>/dev/null; then
		@logshowpassed "[lf] has been removed successfully\n"
	else
		@logshowfailed "[lf] has been removed unsuccessfully\n"
	fi
fi
