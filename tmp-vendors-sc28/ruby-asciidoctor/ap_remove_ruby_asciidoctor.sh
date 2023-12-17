# Dependencies: gem

if type asciidoctor &>/dev/null; then
	if type gem &>/dev/null; then
		@logshow "Removing [asciidoctor] using [gem]\n"
		gem uninstall asciidoctor

		if ! type asciidoctor &>/dev/null; then
			@logshowpassed "[asciidoctor] has been removed successfully\n"
		else
			@logshowfailed "[asciidoctor] has been removed unsuccessfully\n"
		fi
	else
		@logshow "Cannot find [gem] command to remove [asciidoctor]\n"
	fi
fi
