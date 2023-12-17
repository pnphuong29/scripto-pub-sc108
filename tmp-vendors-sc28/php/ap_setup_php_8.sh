if [[ "${AP_OS_TYPE}" == "${AP_OS_TYPE_MACOS}" ]]; then
	brew list --version | grep php@8.0 &>/dev/null
	if [[ "$?" != 0 ]]; then
		@logshow "Installing [PHP 8.0] using [brew]\n"
		brew install php@8.0
		@addpath "/usr/local/opt/php@8.0/bin"
		brew list --versions | grep php@8.0 &>/dev/null
	fi
elif [[ "${AP_OS_TYPE}" == "${AP_OS_TYPE_UBUNTU}" ]]; then
	if ! type php &>/dev/null; then
		@logshow "Installing [PHP 8.0] using [apt]\n"
		sudo apt install -y software-properties-common
		sudo add-apt-repository -y ppa:ondrej/php
		sudo apt update
		sudo apt install -y php8.0 libapache2-mod-php8.0
		sudo systemctl restart apache2
		php -v | grep "PHP 8.0" &>/dev/null
	fi
fi

if [[ $? == 0 ]]; then
	@logshowpassed "[PHP 8.0] has been installed successfully\n"
else
	@logshowfailed "[PHP 8.0] has been installed unsuccessfully\n"
fi
