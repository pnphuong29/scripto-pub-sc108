# https://dandavison.github.io/delta/installation.html

# @@ap-todo $$ try installing delta by compiling source code using cargo
if ! type delta &>/dev/null; then
	if type cargo &>/dev/null; then
		@logshow "Installing [delta] using [cargo]\n"

		cargo install git-delta

		if type delta &>/dev/null; then
			@logshowpassed "[delta] has been installed successfully using [cargo]\n"
		else
			@logshowfailed "[delta] has been installed unsuccessfully using [cargo]\n"
		fi
	else
		if [[ "${AP_OS_TYPE}" == "${AP_OS_TYPE_MACOS}" ]]; then
			@logshow "Installing [delta] using [brew]\n"
			brew install git-delta

			if type delta &>/dev/null; then
				@logshowpassed "[delta] has been installed successfully using [brew]\n"
			else
				@logshowfailed "[delta] has been installed unsuccessfully using [brew]\n"
			fi
		elif [[ "${AP_OS_TYPE}" == "${AP_OS_TYPE_UBUNTU}" ]]; then
			@logshow "Installing [delta] using [apt]\n"
			sudo apt update
			sudo apt install -y git-delta

			if type delta &>/dev/null; then
				@logshowpassed "[delta] has been installed successfully using [apt]\n"
			else
				@logshowfailed "[delta] has been installed unsuccessfully using [apt]\n"
			fi
		fi
	fi
fi
