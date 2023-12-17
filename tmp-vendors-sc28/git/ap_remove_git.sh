# https://git-scm.com/download/mac
# https://git-scm.com/download/linux

export AP_VENDORS_GIT_SETUP_DIR="${AP_SCRIPTO_COMMON_DIR}/vendors/git"
export AP_VENDORS_GIT_SETUP_CONFIGS_DIR="${AP_VENDORS_GIT_SETUP_DIR}/configs"

if [[ "${AP_OS_TYPE}" == "${AP_OS_TYPE_MACOS}" ]]; then
	brew list --versions | grep git &>/dev/null
	if [[ "$?" == 0 ]]; then
		@logshow "Removing [git] using [brew]\n"
		brew install git

		brew list --versions | grep "git"
		if [[ "$?" != 0 ]]; then
			@logshowpassed "[git] has been removed successfully using [brew]\n"
		else
			@logshowfailed "[git] has been removed successfully using [brew]\n"
		fi
	fi
elif [[ "${AP_OS_TYPE}" == "${AP_OS_TYPE_UBUNTU}" ]]; then
	if type git &>/dev/null; then
		@logshow "Removing [git] using [apt]\n"

		sudo apt purge -y git
		sudo apt autoremove -y

		if ! type git &>/dev/null; then
			@logshowpassed "[git] has been removed successfully using [apt]\n"
		else
			@logshowfailed "[git] has been removed successfully using [apt]\n"
		fi
	fi
fi

# Remove git config file
rm -f ~/.gitconfig
