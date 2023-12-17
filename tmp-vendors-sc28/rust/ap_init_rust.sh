source "${HOME}/.cargo/env"

# Autocomplete
if type rustup &>/dev/null; then
	source <(rustup completions bash)
	source <(rustup completions bash cargo)
fi
