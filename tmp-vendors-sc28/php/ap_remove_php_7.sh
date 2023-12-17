if [[ "${AP_OS_TYPE}" == "${AP_OS_TYPE_MACOS}" ]]; then
	brew list --version | grep php@7.4 &>/dev/null
	if [[ "$?" == 0 ]]; then
		echo "Removing [PHP 7.4] using brew"
		brew uninstall php@7.4
		echo "Removed [PHP 7.4] successfully" >&21
	fi
elif [[ "${AP_OS_TYPE}" == "${AP_OS_TYPE_UBUNTU}" ]]; then
	if type php &>/dev/null; then
		echo "Removing [PHP 7.4] using apt"
		sudo apt update
		sudo apt remove -y php7.4
		echo "Removed [PHP 7.4] successfully" >&21
	fi
fi
