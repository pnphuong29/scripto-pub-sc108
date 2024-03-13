alias apinitpgcli="ap_func_init_pgcli"
ap_func_init_pgcli() {
    if alias apinitpgclishare &>/dev/null; then
        apinitpgclishare
    fi

    if alias apinitpgclicommon &>/dev/null; then
        apinitpgclicommon
    fi
}

alias apcreatedirstructpgcli="ap_func_create_dirstruct_pgcli"
ap_func_create_dirstruct_pgcli() {
    if alias apcreatedirstructpgclishare &>/dev/null; then
        apcreatedirstructpgclishare
    fi

    if alias apcreatedirstructpgclicommon &>/dev/null; then
        apcreatedirstructpgclicommon
    fi
}

alias aprmdirstructpgcli="ap_func_rm_dirstruct_pgcli"
ap_func_rm_dirstruct_pgcli() {
    if alias aprmdirstructpgclishare &>/dev/null; then
        aprmdirstructpgclishare
    fi

    if alias aprmdirstructpgclicommon &>/dev/null; then
        aprmdirstructpgclicommon
    fi
}

alias apsetuppgcli="ap_func_setup_pgcli"
ap_func_setup_pgcli() {
    # https://github.com/dbcli/pgcli
    aplogshow "Install [pgcli]\n"
    pip install pgcli

    apinitpgcli
    if alias apcreatedirstructpgcli &>/dev/null; then
        apcreatedirstructpgcli
    fi
}

alias aprmpgcli="ap_func_rm_pgcli"
ap_func_rm_pgcli() {
    aplogshow "Remove [pgcli]\n"
    pip uninstall pgcli

    if alias aprmdirstructpgcli &>/dev/null; then
        aprmdirstructpgcli
    fi

    if alias aprmglobalsymlinkpgcli &>/dev/null; then
        aprmglobalsymlinkpgcli
    fi
}

alias @pgcli='ap_func_pgcli'
# @$func $$ ap_func_pgcli {
# ap_func_pgcli *<host> *<port> *<user> *<pass> <db>
# Description
# 	Quickly connect to PG DB using short syntax
# Return status
#	AP_CODE_SUCCESS
# }
ap_func_pgcli() {
    if [ "$#" -lt 4 ]; then
        rtn_error_not_enough_arguments
    fi

    local ap_host="$1"
    local ap_port="$2"
    local ap_user="$3"
    local ap_pass="$4"
    local ap_db="${5:-}"

    if [ -n "${ap_db}" ]; then
        PGPASSWORD=${ap_pass} pgcli -h "${ap_host}" -p "${ap_port}" -u "${ap_user}" -d "${ap_db}"
    else
        PGPASSWORD=${ap_pass} pgcli -h "${ap_host}" -p "${ap_port}" -u "${ap_user}"
    fi
}
