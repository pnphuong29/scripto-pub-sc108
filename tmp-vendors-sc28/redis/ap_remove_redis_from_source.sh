# https://redis.io/docs/getting-started/installation/install-redis-from-source/
# https://redis.io/docs/getting-started/

if type redis-cli &>/dev/null; then
	@logshow "Removing [redis]\n"

	# rm -rf "${AP_SOFT_DIR}/redis"
	sudo rm -f /usr/local/bin/redis*
	sudo rm -rf /etc/redis
	sudo rm -rf /var/redis/6379

	sudo update-rc.d redis_6379 remove -f # remove Redis init script from all the default runlevels
	sudo rm -f /etc/init.d/redis_6379

	if ! type redis-cli &>/dev/null; then
		@logshowpassed "[redis] has been removed successfully\n"
	else
		@logshowfailed "[redis] has been removed unsuccessfully\n"
	fi
fi
