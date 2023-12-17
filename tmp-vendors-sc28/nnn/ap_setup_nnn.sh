# https://github.com/jarun/nnn
# https://github.com/jarun/nnn/wiki/Usage

export AP_NNN_SETUP_VERSION='4.6'
export AP_VENDORS_NNN_SETUP_DIR="${AP_SCRIPTO_COMMON_DIR}/vendors/nnn"
export AP_VENDORS_NNN_SETUP_CONFIGS_DIR="${AP_VENDORS_NNN_SETUP_DIR}/configs"
export AP_VENDORS_NNN_DIR="${AP_SOFT_DIR}/nnn/nnn-${AP_NNN_SETUP_VERSION}"
export AP_VENDORS_NNN_REPO_URL="https://github.com/jarun/nnn"

if ! type nnn &>/dev/null; then
	local AP_NNN_SETUP_VERSION='4.6'

	@logshow "Installing [nnn v${AP_NNN_SETUP_VERSION}] using [compiling source code]\n"

	# Install required libraries
	if [[ "${AP_OS_TYPE}" == "${AP_OS_TYPE_UBUNTU}" ]]; then
		@logshow "Install required libraries before compiling source code\n"
		sudo apt install -y pkg-config libncursesw5-dev libreadline-dev
	fi

	# Install nnn
	cd "${AP_TMP_DIR}"
	rm -rf "${AP_VENDORS_NNN_DIR}"

	# Uncommnent this if you want to install latest version (but with your own risk!)
	# ghq get https://github.com/jarun/nnn.git

	curl -SOL "${AP_VENDORS_NNN_REPO_URL}/releases/download/v${AP_NNN_SETUP_VERSION}/nnn-v${AP_NNN_SETUP_VERSION}.tar.gz"
	tar -zxf "nnn-v${AP_NNN_SETUP_VERSION}.tar.gz"
	cd "nnn-${AP_NNN_SETUP_VERSION}"

	# O_ICONS=1: enable icons-in-terminal icons
	# O_NERD=1: enable Nerdfont icons
	# O_EMOJI=1: enable Emojis
	PREFIX="${AP_VENDORS_NNN_DIR}" make O_ICONS=1 O_NERD=1 O_EMOJI=1 strip install
	@addpath "${AP_VENDORS_NNN_DIR}/bin"
	sudo ln -sf "${AP_VENDORS_NNN_DIR}/bin/nnn" /usr/local/bin/nnn

	# Install bash completion
	@logshow "Install bash completion for nnn\n"
	cp -f "${AP_TMP_DIR}/nnn-${AP_NNN_SETUP_VERSION}/misc/auto-completion/bash/nnn-completion.bash" "${AP_VENDORS_NNN_SETUP_CONFIGS_DIR}/ap_completion_nnn.bash"

	# Install plugins
	@logshow "Install plugins for nnn\n"
	curl -Ls https://raw.githubusercontent.com/jarun/nnn/master/plugins/getplugs | sh

	if type nnn &>/dev/null; then
		@logshowpassed "[nnn v${AP_NNN_SETUP_VERSION}] has been installed successfully using [compiling source code]\n"
	else
		@logshowfailed "[nnn v${AP_NNN_SETUP_VERSION}] has been installed unsuccessfully using [compiling source code]\n"
	fi
fi

# Use `brew` to install `nnn` in macOS only if you want latest version of nnn
# if [[ "${AP_OS_TYPE}" == "${AP_OS_TYPE_MACOS}" ]]; then
# 	@logshow "Installing [nnn] using [brew]\n"

# 	brew install nnn

# 	if brew list --versions | grep nnn &>/dev/null; then
# 		@logshowpassed "[nnn] has been installed successfully using [brew]\n"
# 	else
# 		@logshowfailed "[nnn] has been installed unsuccessfully using [brew]\n"
# 	fi
# fi
