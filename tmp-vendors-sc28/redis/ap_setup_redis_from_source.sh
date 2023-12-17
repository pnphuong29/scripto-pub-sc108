# https://redis.io/docs/getting-started/installation/install-redis-from-source/
# https://redis.io/docs/getting-started/

export AP_VENDORS_REDIS_DIR="${AP_SOFT_DIR}/redis"

if ! type redis-cli &>/dev/null; then
	@logshow "Installing [redis]\n"

	cd "${AP_TMP_DIR}"
	curl -LO "https://download.redis.io/redis-stable.tar.gz"
	rm -rf redis-stable

	tar -zxf redis-stable.tar.gz
	cd redis-stable
	make
	sudo make install # /usr/local/bin

	sudo mkdir -p /etc/redis
	sudo mkdir -p /var/redis/6379

	sudo cp -f utils/redis_init_script /etc/init.d/redis_6379
	sudo cp -f redis.conf /etc/redis/6379.conf

	sudo update-rc.d redis_6379 defaults # add Redis init script to all the default runlevels
	# sudo /etc/init.d/redis_6379 start &

	if type redis-cli &>/dev/null; then
		@logshowpassed "[redis] has been installed successfully\n"
	else
		@logshowfailed "[redis] has been installed unsuccessfully\n"
	fi
fi
