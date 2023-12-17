# https://github.com/kamiyaa/joshuto
# Dependencies: ghq

export AP_VENDORS_RUST_JOSHUTO_SETUP_DIR="${AP_SCRIPTO_COMMON_DIR}/vendors/rust-joshuto"
export AP_VENDORS_RUST_JOSHUTO_SETUP_CONFIGS_DIR="${AP_VENDORS_RUST_JOSHUTO_SETUP_DIR}/configs"
export AP_VENDORS_RUST_JOSHUTO_REPO_URL="https://github.com/kamiyaa/joshuto"
export AP_VENDORS_RUST_JOSHUTO_GH_DIR="${AP_GH_DIR}/kamiyaa/joshuto"

if ! type joshuto &>/dev/null; then
	@logshow "Installing [joshuto] using [cargo]\n"

	ghq get "${AP_VENDORS_RUST_JOSHUTO_REPO_URL}"
	cd "${AP_VENDORS_RUST_JOSHUTO_GH_DIR}"
	cargo install --path=. --force

	# sudo ln -sf "${AP_VENDORS_RUST_JOSHUTO_SETUP_DIR}/bin/joshuto_wrapper.sh" /usr/local/bin/joshuto_wrapper
	sudo ln -sf ~/.cargo/bin/joshuto /usr/local/bin/joshuto

	if type joshuto &>/dev/null; then
		@logshowpassed "[joshuto] has been installed successfully using [cargo]\n"
	else
		@logshowfailed "[joshuto] has been installed unsuccessfully using [cargo]\n"
	fi
fi
