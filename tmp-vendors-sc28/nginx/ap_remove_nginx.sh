# https://nginx.org/en/linux_packages.html

export AP_VENDORS_NGINX_SETUP_DIR="${AP_SCRIPTO_COMMON_DIR}/vendors/nginx"
export AP_VENDORS_NGINX_SETUP_CONFIGS_DIR="${AP_VENDORS_NGINX_SETUP_DIR}/configs"

if type nginx &>/dev/null; then
	if [[ "${AP_OS_TYPE}" == "${AP_OS_TYPE_MACOS}" ]]; then
		@logshow "Removing [nginx] using [brew]\n"
		brew uninstall nginx

		if ! brew list --versions | grep nginx &>/dev/null; then
			@logshowpassed "[nginx] has been removed successfully using [brew]\n"
		else
			@logshowfailed "[nginx] has been removed unsuccessfully using [brew]\n"
		fi
	elif [[ "${AP_OS_TYPE}" == "${AP_OS_TYPE_UBUNTU}" ]]; then
		@logshow "Removing [nginx] using [apt]\n"
		sudo apt purge -y nginx
		sudo apt autoremove -y

		if ! type nginx &>/dev/null; then
			@logshowpassed "[nginx] has been removed successfully using [apt]\n"
		else
			@logshowfailed "[nginx] has been removed unsuccessfully using [apt]\n"
		fi
	fi
fi
