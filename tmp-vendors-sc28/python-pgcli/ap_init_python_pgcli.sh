# https://github.com/dbcli/pgcli

export AP_VENDORS_PYTHON_PGCLI_SETUP_DIR="${AP_SCRIPTO_COMMON_DIR}/vendors/python-pgcli"
alias zpgclisetupdir="cd ${AP_VENDORS_PYTHON_PGCLI_SETUP_DIR}"
alias vipgcliconfigs="vi ${AP_VENDORS_PYTHON_PGCLI_SETUP_DIR}/ap_init_python_pgcli.sh"

# @$alias $$ ap_func_pgcli {
alias ap_alias_pgcli='ap_func_pgcli'
alias pgclif='ap_func_pgcli'
alias pgcliflocal='pgclif localhost'
alias pgcliflocalport='pgclif localhost 5432'
# }

# @$func $$ ap_func_pgcli {
# ap_func_pgcli *<host> *<port> *<user> *<pass> <db>
# Description
# 	Quickly connect to PG DB using short syntax
# Return status
#	AP_CODE_SUCCESS
# }

ap_func_pgcli() {
    if [[ "$#" -lt 4 ]]; then
        @reterror_not_enough_arguments
    fi

    local ap_host="$1"
    local ap_port="$2"
    local ap_user="$3"
    local ap_pass="$4"
    local ap_db="${5:-}"

    if [[ -n "${ap_db}" ]]; then
        PGPASSWORD=${ap_pass} pgcli -h "${ap_host}" -p "${ap_port}" -u "${ap_user}" -d "${ap_db}"
    else
        PGPASSWORD=${ap_pass} pgcli -h "${ap_host}" -p "${ap_port}" -u "${ap_user}"
    fi

    @rtn_success
}
