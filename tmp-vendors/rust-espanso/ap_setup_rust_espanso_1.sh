# https://espanso.org/install/
# Dependencies: cargo-make, cargo, rustup, ghq

export AP_VENDORS_ESPANSO_GH_DIR="${AP_GH_DIR}/federico-terzi/espanso"

if ! type espanso &>/dev/null; then
	if type cargo &>/dev/null; then
		@logshow "Installing [espanso] using [compiling source codes]\n"

		if [[ "${AP_OS_TYPE}" == "${AP_OS_TYPE_UBUNTU}" ]]; then
			@logshow "Installing [required libraries]\n"
			sudo apt update
			sudo apt install libx11-dev libxtst-dev libxkbcommon-dev libdbus-1-dev libwxgtk3.0-gtk3-dev libssl-dev
		fi

		cargo install --force cargo-make --version 0.34.0

		# Install espanso
		ghq get https://github.com/federico-terzi/espanso
		cd "${AP_VENDORS_ESPANSO_GH_DIR}"
		cargo make --profile release build-binary

		# Make symbolic link
		ln -sf "${AP_VENDORS_ESPANSO_GH_DIR}/target/release/espanso" "${AP_SOFT_DIR}/bin/espanso"

		# Register espanso as a systemd service (required only once)
		espanso service register

		# Start espanso
		espanso start
	else
		@logshow "Cannot find [cargo] to install [espanso]\n"
	fi

	# Validation
	if type espanso &>/dev/null; then
		@logshowpassed "[espanso] has been installed successfully using [compiling source code]\n"
	else
		@logshowfailed "[espanso] has been installed unsuccessfully using [compiling source code]\n"
	fi
fi
