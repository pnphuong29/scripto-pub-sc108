# https://github.com/dbcli/mycli

alias @mycli='ap_func_mycli'
alias @myclilocal='ap_func_mycli localhost "${AP_PORT_MYSQL_PUBLIC}" root "$(cat "${HOME}/secrets/ap_mysql_root.passwd")"'
alias @mycliddns1='ap_func_mycli ${AP_DOMAIN_DDNS1} "${AP_PORT_MYSQL_PUBLIC}" root "$(cat "${HOME}/secrets/ap_mysql_root.passwd")"'
alias @mycliddns4='ap_func_mycli ${AP_DOMAIN_DDNS4} "${AP_PORT_MYSQL_PUBLIC}" root "$(cat "${HOME}/secrets/ap_mysql_root.passwd")"'

# @$func $$ ap_func_mycli {
# ap_func_mycli *<host> *<port> *<user> *<pass> <db>
# Description
# 	Quickly connect to MySQL DB using short syntax
# Return status
#	AP_CODE_SUCCESS
# }
ap_func_mycli() {
    if [ "$#" -lt 4 ]; then
        @rtn_error_not_enough_arguments
    fi

    local ap_host="$1"
    local ap_port="$2"
    local ap_user="$3"
    local ap_pass="$4"
    local ap_db=""

    if [ -n "$5" ]; then
        ap_db="$5"
        mycli -h "${ap_host}" -P "${ap_port}" -u "${ap_user}" -p "${ap_pass}" -D "${ap_db}"
    else
        mycli -h "${ap_host}" -P "${ap_port}" -u "${ap_user}" -p "${ap_pass}"
    fi

    @rtn_success
}
