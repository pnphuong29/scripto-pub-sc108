# https://github.com/ajeetdsouza/zoxide
# Dependencies: ranger

export AP_VENDORS_ZOXIDE_DIR="${AP_SCRIPTO_COMMON_DIR}/vendors/rust-zoxide"
export _ZO_DATA_DIR="${AP_SCRIPTO_MAIN_DIR}/data/rust-zoxide" # This env var must be declared before activating zoxide as on below codes
export _ZO_ECHO=1                                             # When set to 1, z will print the matched directory before navigating to it.

if ! type zoxide &>/dev/null; then
	@logshow "Installing [zoxide]\n"

	# Install zoxide
	curl -sS https://raw.githubusercontent.com/ajeetdsouza/zoxide/main/install.sh | bash

	# Activate zoxide
	eval "$(zoxide init bash)"

	# Install zoxide as a plugin for ranger
	@minfo "Install zoxide as a plugin for ranger\n"
	git clone git@github.com:jchook/ranger-zoxide.git ~/.config/ranger/plugins/zoxide

	if type zoxide &>/dev/null; then
		@logshowpassed "[zoxide] has been installed successfully\n"
	else
		@logshowfailed "[zoxide] has been installed unsuccessfully\n"
	fi
fi
