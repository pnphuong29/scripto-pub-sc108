# https://github.com/starship/starship#-installation

export AP_VENDORS_RUST_STARSHIP_SETUP_DIR="${AP_SCRIPTO_COMMON_DIR}/vendors/rust-starship"
export AP_VENDORS_RUST_STARSHIP_SETUP_CONFIGS_DIR="${AP_VENDORS_RUST_STARSHIP_SETUP_DIR}/configs"
export AP_VENDORS_RUST_STARSHIP_REPO_URL="https://github.com/starship/starship"
export AP_VENDORS_RUST_STARSHIP_GH_DIR="${AP_GH_DIR}/starship/starship"

if ! type starship &>/dev/null; then
	@logshow "Installing [starship]\n"
	curl -sS https://starship.rs/install.sh | sh

	if type starship &>/dev/null; then
		@logshowpassed "[starship] has been installed successfully\n"
	else
		@logshowfailed "[starship] has been installed unsuccessfully\n"
	fi
fi
