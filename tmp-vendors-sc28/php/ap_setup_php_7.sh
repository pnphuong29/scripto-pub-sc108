if [[ "${AP_OS_TYPE}" == "${AP_OS_TYPE_MACOS}" ]]; then
	brew list --version | grep php@7.4 &>/dev/null
	if [[ "$?" != 0 ]]; then
		echo "Installing [PHP 7.4] using brew"
		brew install php@7.4
		brew list --versions | grep PHP@7.4 &>/dev/null
	fi
elif [[ "${AP_OS_TYPE}" == "${AP_OS_TYPE_UBUNTU}" ]]; then
	if ! type php &>/dev/null; then
		echo "Installing [PHP 7.4] using apt"
		sudo apt update
		sudo apt install -y php7.4
		php -v | grep "PHP 7.4" &>/dev/null
	fi
fi

[[ $? == 0 ]] && echo "Installing [PHP 7.4] successfully" >&21
