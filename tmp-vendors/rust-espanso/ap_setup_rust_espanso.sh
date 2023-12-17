# https://espanso.org/install/
# Dependencies: cargo-make, cargo, rustup, ghq

if ! type espanso &>/dev/null; then
	if [[ "${AP_OS_TYPE}" == "${AP_OS_TYPE_MACOS}" ]]; then
		@logshow "Installing [espanso] using [brew]\n"
		brew install --cask espanso
	elif [[ "${AP_OS_TYPE}" == "${AP_OS_TYPE_UBUNTU}" ]]; then
		if type cargo &>/dev/null; then
			# Install required libraries
			@logshow "Installing [required libraries] for [espanso]\n"
			sudo apt update
			sudo apt install -y libx11-dev libxtst-dev libxkbcommon-dev libdbus-1-dev libwxgtk3.0-gtk3-dev libssl-dev
			cargo install --force cargo-make --version 0.34.0

			export AP_VENDORS_ESPANSO_GH_DIR="${AP_GH_DIR}/federico-terzi/espanso"
			@logshow "Installing [espanso] using [compiling source codes]\n"

			# Install espanso
			ghq get https://github.com/federico-terzi/espanso
			cd "${AP_VENDORS_ESPANSO_GH_DIR}"
			cargo make --profile release build-binary

			# Make symbolic link
			ln -sf "${AP_VENDORS_ESPANSO_GH_DIR}/target/release/espanso" "${AP_SOFT_DIR}/bin/espanso"
		else
			@logshow "Cannot find [cargo] to install [espanso]\n"
		fi
	fi
fi

# Validation
if type espanso &>/dev/null; then
	@logshowpassed "[espanso] has been installed successfully using [compiling source code]\n"

	@logshow "Registering and starting espanso service\n"
	# Register espanso as a systemd service (required only once)
	espanso service register

	# Start espanso
	espanso start
else
	@logshowfailed "[espanso] has been installed unsuccessfully using [compiling source code]\n"
fi
