export AP_VENDORS_REDIS_SETUP_DIR="${AP_SCRIPTO_COMMON_DIR}/vendors/redis"

# @$alias $$ ap_func_get_redis_passwd
ap_alias_get_redis_passwd='ap_func_get_redis_passwd'

# @$func $$ ap_func_get_redis_passwd
# ap_func_get_redis_passwd [--]
# Description
# 	Get redis passwd in local machine
# Return
# 	AP_CODE_SUCCESS

ap_func_get_redis_passwd() {
	if [[ "${AP_OS_TYPE}" == "${AP_OS_TYPE_MACOS}" ]]; then
		echo -n "$(grep ^requirepass /usr/local/etc/redis.conf | awk '{print $2}')"
	elif [[ "${AP_OS_TYPE}" == "${AP_OS_TYPE_UBUNTU}" ]]; then
		echo -n "$(grep ^requirepass /etc/redis/redis.conf | awk '{print $2}')"
	fi

	@rtn_success
}

# @$alias $$ ap_func_redis_update_configs {
alias ap_alias_redis_update_configs='ap_func_redis_update_configs'
# }

# @$func $$ ap_func_redis_update_configs {
# ap_func_redis_update_configs
# Description
# 	Configure redis
# Return status
#	AP_CODE_SUCCESS
# }

ap_func_redis_update_configs() {
	local ap_pos

	@minfo "Updating [/etc/redis/redis.conf] file\n"
	sudo cp /etc/redis/redis.conf /etc/redis/redis.conf.bak
	ap_pos=$(sudo grep -n "${AP_MARKER_START}" /etc/redis/redis.conf | head -1 | cut -d : -f 1)
	[[ -n "${ap_pos}" ]] && ap_pos=$((ap_pos - 1)) && sudo gsed -i'' "${ap_pos},$$d" /etc/redis/redis.conf
	echo | sudo tee -a /etc/redis/redis.conf
	cat "${AP_VENDORS_NEXTCLOUD_SERVER_SETUP_DIR}/configs/ap_redis.conf" | sudo tee -a /etc/redis/redis.conf

	if [[ "${AP_OS_TYPE}" == "${AP_OS_TYPE_UBUNTU}" ]]; then
		# https://redis.io/docs/manual/admin/
		# Set the Linux kernel overcommit memory setting to 1
		if ! grep "vm.overcommit_memory = 1" /etc/sysctl.conf &>/dev/null; then
			@minfo "Enabling overcommit_memory in [/etc/sysctl.conf] file\n"
			sudo cp /etc/sysctl.conf /etc/sysctl.conf.bak
			echo | sudo tee -a /etc/sysctl.conf
			echo "vm.overcommit_memory = 1" | sudo tee -a /etc/sysctl.conf
		fi

		# To ensure the Linux kernel feature Transparent Huge Pages does not impact Redis memory usage and latency
		if ! grep "kernel/mm/transparent_hugepage/enabled = never" /etc/sysctl.conf &>/dev/null; then
			@minfo "Ensure the Linux kernel feature Transparent Huge Pages does not impact Redis memory usage and latency in [/etc/sysctl.conf] file\n"
			sudo cp /etc/sysctl.conf /etc/sysctl.conf.bak
			echo "kernel/mm/transparent_hugepage/enabled = never" | sudo tee -a /etc/sysctl.conf
		fi
	fi

	# Restart Redis
	@minfo "You should restart Redis server\n"

	@rtn_success
}
