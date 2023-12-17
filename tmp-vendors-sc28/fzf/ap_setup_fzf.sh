# https://github.com/junegunn/fzf#installation

if ! type fzf &>/dev/null; then
	@logshow "Installing [fzf]\n"

	export AP_VENDORS_FZF_DIR="${HOME}/.fzf"

	# Remove old fzf dir if any
	rm -rf "${AP_VENDORS_FZF_DIR}"

	# Install fzf
	git clone --depth 1 https://github.com/junegunn/fzf.git "${AP_VENDORS_FZF_DIR}"
	"${AP_VENDORS_FZF_DIR}/install" --no-zsh --no-fish --no-key-bindings --completion --no-update-rc

	# Autocomplete and configure PATH for fzf
	[ -f ~/.fzf.bash ] && source ~/.fzf.bash

	if type fzf &>/dev/null; then
		@logshowpassed "[fzf] has been installed successfully\n"
	else
		@logshowfailed "[fzf] has been installed unsuccessfully\n"
	fi
fi
