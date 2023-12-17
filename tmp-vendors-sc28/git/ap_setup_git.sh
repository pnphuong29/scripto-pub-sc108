# https://git-scm.com/download/mac
# https://git-scm.com/download/linux

export AP_VENDORS_GIT_SETUP_DIR="${AP_SCRIPTO_COMMON_DIR}/vendors/git"
export AP_VENDORS_GIT_SETUP_CONFIGS_DIR="${AP_VENDORS_GIT_SETUP_DIR}/configs"

if [[ "${AP_OS_TYPE}" == "${AP_OS_TYPE_MACOS}" ]]; then
	brew list --versions | grep git &>/dev/null
	if [[ "$?" != 0 ]]; then
		@logshow "Installing [git] using [brew]\n"
		brew install git

		ap_git_version="$(brew list --versions | grep "git ")"
		if [[ -n "${ap_git_version}" ]]; then
			@logshowpassed "[git v${ap_git_version}] has been installed successfully using [brew]\n"
		else
			@logshowfailed "[git v${ap_git_version}] has been installed successfully using [brew]\n"
		fi
	fi
elif [[ "${AP_OS_TYPE}" == "${AP_OS_TYPE_UBUNTU}" ]]; then
	@logshow "Installing [git] using [apt]\n"

	sudo add-apt-repository -y ppa:git-core/ppa
	sudo apt update
	sudo apt install -y git

	ap_git_version="$(git --version | cut -d ' ' -f 3)"
	if [[ -n "${ap_git_version}" ]]; then
		@logshowpassed "[git v${ap_git_version}] has been installed successfully using [apt]\n"
	else
		@logshowfailed "[git v${ap_git_version}] has been installed successfully using [apt]\n"
	fi
fi

# Install git autocomplete
if [[ ! -f "${AP_COMPLETIONS_DIR}/ap_completion_git.bash" ]]; then
	@logshow "Installing [git bash completion]\n"
	curl -L "https://raw.githubusercontent.com/git/git/master/contrib/completion/git-completion.bash" -o "${AP_VENDORS_GIT_SETUP_CONFIGS_DIR}/ap_completion_git.bash"

	if [[ -f "${AP_COMPLETIONS_DIR}/ap_completion_git.bash" ]]; then
		@logshowpassed "[git bash completion] has been installed successfully\n"
	else
		@logshowfailed "[git bash completion] has been installed unsuccessfully\n"
	fi
fi
