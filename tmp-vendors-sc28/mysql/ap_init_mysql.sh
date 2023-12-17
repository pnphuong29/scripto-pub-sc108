export AP_VENDORS_MYSQL_SERVER_SETUP_DIR="${AP_SCRIPTO_COMMON_DIR}/vendors/mysql"

if [[ "${AP_OS_TYPE}" == "${AP_OS_TYPE_MACOS}" ]]; then
	export AP_MYSQL_DATA_DIR_DEFAULT="/usr/local/var/mysql"
else
	export AP_MYSQL_DATA_DIR_DEFAULT="/var/lib/mysql"
fi

alias vimysqlserverconfigs="vi ${AP_VENDORS_MYSQL_SERVER_SETUP_DIR}/ap_init_mysql.sh"

# @$alias $$ ap_func_mysql_reset_root_passwd {
alias ap_alias_mysql_reset_root_passwd='ap_func_mysql_reset_root_passwd'
alias resetmysqlrootpass='ap_func_mysql_reset_root_passwd'
# }

# @$func $$ ap_func_mysql_reset_root_passwd {
# ap_func_mysql_reset_root_passwd [--] <new_root_passwd>
# Description
# 	Reset mysql password of root@localhost
# Parameters
# 	<new_root_passwd>	New password for root@locahost (default: root)
# Return status
#	AP_CODE_SUCCESS
# }

ap_func_mysql_reset_root_passwd() {
	local ap_new_root_passwd='root'
	local ap_reset_passwd_sql_file='/tmp/reset.sql'

	[[ -n "${1:-}" ]] && ap_new_root_passwd="$1"

	# Create tmp file for resetting root password
	@minfo "Create tmp file at [${ap_reset_passwd_sql_file}]\n"
	echo "ALTER USER root@localhost IDENTIFIED WITH mysql_native_password BY '${ap_new_root_passwd}';" >"${ap_reset_passwd_sql_file}"

	if [[ "${AP_OS_TYPE}" == "${AP_OS_TYPE_MACOS}" ]]; then
		# Stop current mysql server
		@minfo "Stopping current mysql server\n"
		brew services stop mysql
		sleep 3 # wait for 3 seconds for mysqld to be fully loaded

		# Resetting mysql root password
		@minfo "Resetting mysql root password\n"
		mysqld_safe --init-file="${ap_reset_passwd_sql_file}" &
		sleep 3                                   # wait for 3 seconds for mysqld to be fully loaded
		kill -KILL $(pgrep -d ' ' -f mysqld_safe) # Terminate current mysql server after resetting password

		# Start mysql server
		@minfo "Start mysql server\n"
		brew services start mysql

		# Remove tmp file
		@minfo "Removing tmp file [${ap_reset_passwd_sql_file}]\n"
		rm -f "${ap_reset_passwd_sql_file}"
	elif [[ "${AP_OS_TYPE}" == "${AP_OS_TYPE_UBUNTU}" ]]; then
		# Update ownership of tmp file for mysql server to read
		sudo chown mysql "${ap_reset_passwd_sql_file}"

		# Stop current mysql server
		@minfo "Stopping current mysql server\n"
		sudo service mysql stop
		sleep 3 # wait for 3 seconds for mysqld to be fully loaded

		sudo mkdir -p /var/run/mysqld # For mysqld service to create a new socket file
		sudo chown -R mysql:mysql /var/run/mysqld

		# Resetting mysql root password
		@minfo "Resetting mysql root password\n"
		sudo mysqld --init-file="${ap_reset_passwd_sql_file}" &
		sleep 3                                   # wait for 3 seconds for mysqld to be fully loaded
		sudo kill -KILL $(pgrep -d ' ' -f mysqld) # Terminate current mysql server after resetting password

		# Start mysql server
		@minfo "Start mysql server\n"
		sudo service mysql start

		# Remove tmp file
		@minfo "Removing tmp file [${ap_reset_passwd_sql_file}]\n"
		sudo rm -f "${ap_reset_passwd_sql_file}"
	fi

	@rtn_success
}
