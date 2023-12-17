# Dependencies: gem

if ! type asciidoctor &>/dev/null; then
	if type gem &>/dev/null; then
		@logshow "Installing [asciidoctor] using [gem]\n"
		gem install asciidoctor

		if type asciidoctor &>/dev/null; then
			@logshowpassed "[asciidoctor] has been installed successfully\n"
		else
			@logshowfailed "[asciidoctor] has been installed unsuccessfully\n"
		fi
	else
		@logshow "Cannot find [gem] command to install [asciidoctor]\n"
	fi
fi
