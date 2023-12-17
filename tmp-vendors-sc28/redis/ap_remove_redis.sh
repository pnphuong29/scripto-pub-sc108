# https://redis.io/docs/getting-started/installation/install-redis-on-linux/
# https://redis.io/docs/getting-started/installation/install-redis-from-source/
# https://redis.io/docs/getting-started/

# export AP_VENDORS_REDIS_DIR="${AP_SOFT_DIR}/redis"

if type redis-cli &>/dev/null; then
	if [[ "${AP_OS_TYPE}" == "${AP_OS_TYPE_MACOS}" ]]; then
		@logshow "Removing [redis] using [brew]\n"
		brew uninstall redis

		if ! brew list --versions | grep redis &>/dev/null; then
			@logshowpassed "[redis] has been removed successfully using [brew]\n"
		else
			@logshowfailed "[redis] has been removed unsuccessfully using [brew]\n"
		fi
	elif [[ "${AP_OS_TYPE}" == "${AP_OS_TYPE_UBUNTU}" ]]; then
		@logshow "Removing [redis] using [apt]\n"
		sudo apt purge -y redis redis-server redis-tools
		sudo apt autoremove -y

		if ! type redis-cli &>/dev/null; then
			@logshowpassed "[redis] has been removed successfully using [apt]\n"
		else
			@logshowfailed "[redis] has been removed unsuccessfully using [apt]\n"
		fi
	fi
fi
