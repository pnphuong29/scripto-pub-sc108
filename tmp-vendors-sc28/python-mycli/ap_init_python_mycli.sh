# https://github.com/dbcli/pgcli

export AP_VENDORS_PYTHON_MYCLI_SETUP_DIR="${AP_SCRIPTO_COMMON_DIR}/vendors/python-mycli"
alias zmyclisetupdir="cd ${AP_VENDORS_PYTHON_MYCLI_SETUP_DIR}"
alias vimycliconfigs="vi ${AP_VENDORS_PYTHON_MYCLI_SETUP_DIR}/ap_init_python_mycli.sh"

# @$alias $$ ap_func_mycli {
alias ap_alias_mycli='ap_func_mycli'
alias myclif='ap_func_mycli'
alias myclilocal='myclif localhost'
alias myclilocalport='myclif localhost 3306'
# }

# @$func $$ ap_func_mycli {
# ap_func_mycli *<host> *<port> *<user> *<pass> <db>
# Description
# 	Quickly connect to MySQL DB using short syntax
# Return status
#	AP_CODE_SUCCESS
# }

ap_func_mycli() {
	if [[ "$#" -lt 4 ]]; then
		@reterror_not_enough_arguments
	fi

	local ap_host="$1"
	local ap_port="$2"
	local ap_user="$3"
	local ap_pass="$4"
	local ap_db=""

	if [[ -n "$5" ]]; then
		ap_db="$5"
		mycli -h "${ap_host}" -P "${ap_port}" -u "${ap_user}" -p "${ap_pass}" -D "${ap_db}"
	else
		mycli -h "${ap_host}" -P "${ap_port}" -u "${ap_user}" -p "${ap_pass}"
	fi

	@retsuccess
}
