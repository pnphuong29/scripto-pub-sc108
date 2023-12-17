# https://github.com/pyenv/pyenv

export PYENV_ROOT="${HOME}/.pyenv"
ap_python_version="3.10.0"

if ! type pyenv &>/dev/null; then
	@logshow "Installing dependency libraries before installing [pyenv]\n"

	if [ "${AP_OS_TYPE}" == "${AP_OS_TYPE_MACOS}" ]; then
		brew install openssl readline sqlite3 xz zlib
	elif [ "${AP_OS_TYPE}" == "${AP_OS_TYPE_UBUNTU}" ]; then
		sudo apt update
		sudo apt install -y \
			make \
			build-essential \
			wget \
			curl \
			xz-utils \
			llvm \
			libssl-dev \
			zlib1g-dev \
			libbz2-dev \
			libreadline-dev \
			libsqlite3-dev \
			libncursesw5-dev \
			tk-dev \
			libxml2-dev \
			libxmlsec1-dev \
			libffi-dev \
			liblzma-dev
	fi

	# Install pyenv
	@logshow "Installing [pyenv]\n"
	rm -rf "${PYENV_ROOT}" # remove old pyenv dir if any
	curl https://pyenv.run | bash

	# Activate pyenv
	@addpath "${PYENV_ROOT}/bin"
	eval "$(pyenv init --path)"
	eval "$(pyenv init -)"

	if type pyenv &>/dev/null; then
		@logshowpassed "[pyenv] has been installed successfully\n"
	else
		@logshowfailed "[pyenv] has been installed unsuccessfully\n"
	fi

	# Install Python
	@logshow "Installing [Python ${ap_python_version}]\n"
	pyenv install "${ap_python_version}"
	pyenv global "${ap_python_version}" # Set default global python

	python3 --version | grep "Python 3.10.0" &>/dev/null
	if [[ "$?" == 0 ]]; then
		@logshowpassed "[Python ${ap_python_version}] has been installed successfully\n"
	else
		@logshowfailed "[Python ${ap_python_version}] has been installed unsuccessfully\n"
	fi
fi
