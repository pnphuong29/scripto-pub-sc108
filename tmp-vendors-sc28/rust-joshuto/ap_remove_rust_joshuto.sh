# https://github.com/kamiyaa/joshuto
# Dependencies: ghq

export AP_VENDORS_RUST_JOSHUTO_SETUP_DIR="${AP_SCRIPTO_COMMON_DIR}/vendors/rust-joshuto"
export AP_VENDORS_RUST_JOSHUTO_SETUP_CONFIGS_DIR="${AP_VENDORS_RUST_JOSHUTO_SETUP_DIR}/configs"
export AP_VENDORS_RUST_JOSHUTO_REPO_URL="https://github.com/kamiyaa/joshuto"
export AP_VENDORS_RUST_JOSHUTO_GH_DIR="${AP_GH_DIR}/kamiyaa/joshuto"

if type joshuto &>/dev/null; then
	@logshow "Removing [joshuto] using [cargo]\n"

	cargo uninstall joshuto
	rm -rf "${AP_VENDORS_RUST_JOSHUTO_GH_DIR}"
	rm -rf ~/.config/joshuto
	rm -f "${AP_SOFT_DIR}/bin/joshuto_wrapper"
	sudo rm -f /usr/local/bin/joshuto_wrapper
	sudo rm -f /usr/local/bin/joshuto

	# Unbind keys
	# bind -r "\C- " # Ctrl + Space

	if ! type joshuto &>/dev/null; then
		@logshowpassed "[joshuto] has been removed successfully using [cargo]\n"
	else
		@logshowfailed "[joshuto] has been removed unsuccessfully using [cargo]\n"
	fi
fi
