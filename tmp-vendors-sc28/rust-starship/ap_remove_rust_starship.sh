# https://github.com/starship/starship#-installation

export AP_VENDORS_RUST_STARSHIP_SETUP_DIR="${AP_SCRIPTO_COMMON_DIR}/vendors/rust-starship"
export AP_VENDORS_RUST_STARSHIP_SETUP_CONFIGS_DIR="${AP_VENDORS_RUST_STARSHIP_SETUP_DIR}/configs"
export AP_VENDORS_RUST_STARSHIP_REPO_URL="https://github.com/starship/starship"
export AP_VENDORS_RUST_STARSHIP_GH_DIR="${AP_GH_DIR}/starship/starship"

if type starship &>/dev/null; then
	@logshow "Removing [starship]\n"
	sudo rm -f /usr/local/bin/starship

	if ! type starship &>/dev/null; then
		@logshowpassed "[starship] has been removed successfully\n"
	else
		@logshowfailed "[starship] has been removed unsuccessfully\n"
	fi
fi
