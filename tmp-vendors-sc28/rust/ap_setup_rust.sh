# https://forge.rust-lang.org/infra/other-installation-methods.html

if ! type cargo &>/dev/null; then
	@logshow "Installing [rust]\n"

	curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y --no-modify-path
	source "${HOME}/.cargo/env"

	# Update rust
	rustup update

	# Install validation
	if type cargo &>/dev/null; then
		@logshowpassed "[rust] has been installed successfully\n"
	else
		@logshowfailed "[rust] has been installed unsuccessfully\n"
	fi
fi
