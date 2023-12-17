if type pyenv; then
	@logshow "Removing [pyenv]\n"
	rm -rf "$(pyenv root)"
	@logshowpassed "[pyenv] has been removed successfully\n"
fi
