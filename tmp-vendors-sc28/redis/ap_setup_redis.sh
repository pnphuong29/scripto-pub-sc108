# https://redis.io/docs/getting-started/installation/install-redis-on-linux/
# https://redis.io/docs/getting-started/installation/install-redis-from-source/
# https://redis.io/docs/getting-started/

export AP_VENDORS_REDIS_SETUP_DIR="${AP_SCRIPTO_COMMON_DIR}/vendors/redis"
# export AP_VENDORS_REDIS_DIR="${AP_SOFT_DIR}/redis"

if ! type redis-cli &>/dev/null; then
	if [[ "${AP_OS_TYPE}" == "${AP_OS_TYPE_MACOS}" ]]; then
		@logshow "Installing [redis] using [brew]\n"
		brew install redis

		if brew list --versions | grep redis &>/dev/null; then
			@logshowpassed "[redis] has been installed successfully using [brew]\n"
		else
			@logshowfailed "[redis] has been installed unsuccessfully using [brew]\n"
		fi
	elif [[ "${AP_OS_TYPE}" == "${AP_OS_TYPE_UBUNTU}" ]]; then
		@logshow "Installing [redis] using [apt]\n"

		sudo apt install -y lsb-release
		curl -fsSL https://packages.redis.io/gpg | sudo gpg --dearmor -o /usr/share/keyrings/redis-archive-keyring.gpg

		echo "deb [signed-by=/usr/share/keyrings/redis-archive-keyring.gpg] https://packages.redis.io/deb $(lsb_release -cs) main" | sudo tee /etc/apt/sources.list.d/redis.list

		sudo apt-get update
		sudo apt-get install -y redis redis-server redis-tools
		# sudo snap install redis
		sudo systemctl enable redis-server
		sudo systemctl start redis-server

		if type redis-cli &>/dev/null; then
			@logshowpassed "[redis] has been installed successfully using [apt]\n"
		else
			@logshowfailed "[redis] has been installed unsuccessfully using [apt]\n"
		fi
	fi
fi
