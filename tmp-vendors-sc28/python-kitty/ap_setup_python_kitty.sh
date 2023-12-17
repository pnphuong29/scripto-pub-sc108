# https://sw.kovidgoyal.net/kitty/binary/
# Dependencies: ghq

export AP_VENDORS_PYTHON_KITTY_SETUP_DIR="${AP_SCRIPTO_COMMON_DIR}/vendors/python-kitty"
export AP_VENDORS_PYTHON_KITTY_SETUP_CONFIGS_DIR="${AP_VENDORS_PYTHON_KITTY_SETUP_DIR}/configs"
export AP_VENDORS_PYTHON_KITTY_REPO_URL="https://github.com/kovidgoyal/kitty"
export AP_VENDORS_PYTHON_KITTY_GH_DIR="${AP_GH_DIR}/kovidgoyal/kitty"
export AP_VENDORS_PYTHON_KITTY_THEMES_REPO_URL="https://github.com/dexpota/kitty-themes"
export AP_VENDORS_PYTHON_KITTY_THEMES_GH_DIR="${AP_GH_DIR}/dexpota/kitty-themes"

if [[ "${AP_OS_TYPE}" == "${AP_OS_TYPE_MACOS}" || "${AP_OS_TYPE}" == "${AP_OS_TYPE_UBUNTU}" ]]; then
	@logshow "Installing [kitty]\n"

	# Install kitty terminal
	curl -L https://sw.kovidgoyal.net/kitty/installer.sh | sh /dev/stdin

	# Install kitty themes
	# git clone --depth 1 "${AP_VENDORS_PYTHON_KITTY_THEMES_REPO_URL}.git" ~/.config/kitty/kitty-themes
	ghq get "${AP_VENDORS_PYTHON_KITTY_THEMES_REPO_URL}"

	if [[ "${AP_OS_TYPE}" == "${AP_OS_TYPE_UBUNTU}" ]]; then
		# Create a symbolic link to add kitty to PATH (assuming ~/.local/bin is in
		# your system-wide PATH)
		ln -s ~/.local/kitty.app/bin/kitty ~/.local/bin/
		ln -s ~/.local/kitty.app/bin/kitten ~/.local/bin/
		# Place the kitty.desktop file somewhere it can be found by the OS
		cp ~/.local/kitty.app/share/applications/kitty.desktop ~/.local/share/applications/
		# If you want to open text files and images in kitty via your file manager also add the kitty-open.desktop file
		cp ~/.local/kitty.app/share/applications/kitty-open.desktop ~/.local/share/applications/
		# Update the paths to the kitty and its icon in the kitty.desktop file(s)
		sed -i "s|Icon=kitty|Icon=/home/$USER/.local/kitty.app/share/icons/hicolor/256x256/apps/kitty.png|g" ~/.local/share/applications/kitty*.desktop
		sed -i "s|Exec=kitty|Exec=/home/$USER/.local/kitty.app/bin/kitty|g" ~/.local/share/applications/kitty*.desktop
	fi

	if type kitty &>/dev/null; then
		@logshowpassed "[kitty] has been installed successfully\n"
	else
		@logshowfailed "[kitty] has been installed unsuccessfully\n"
	fi
fi
