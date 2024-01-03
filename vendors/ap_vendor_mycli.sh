alias @initmycli="ap_func_init_mycli"
ap_func_init_mycli() {
    if alias @initmyclishare &>/dev/null; then
        @initmyclishare
    fi

    if alias @initmyclicommon &>/dev/null; then
        @initmyclicommon
    fi
}

alias @createdirstructmycli="ap_func_create_dirstruct_mycli"
ap_func_create_dirstruct_mycli() {
    if alias @createdirstructmyclishare &>/dev/null; then
        @createdirstructmyclishare
    fi

    if alias @createdirstructmyclicommon &>/dev/null; then
        @createdirstructmyclicommon
    fi
}

alias @rmdirstructmycli="ap_func_rm_dirstruct_mycli"
ap_func_rm_dirstruct_mycli() {
    if alias @rmdirstructmyclishare &>/dev/null; then
        @rmdirstructmyclishare
    fi

    if alias @rmdirstructmyclicommon &>/dev/null; then
        @rmdirstructmyclicommon
    fi
}

alias @createglobalsymlinkmycli="ap_func_create_global_symlink_mycli"
ap_func_create_global_symlink_mycli() {
    if [ -f "${AP_SOFT_DIR}/bin/mycli" ]; then
        @logshow "Create symlink from [/usr/local/bin/mycli] to [${AP_SOFT_DIR}/bin/mycli]\n"
        sudo ln -sf "${AP_SOFT_DIR}/bin/mycli" "/usr/local/bin/mycli"
    fi
}

alias @rmglobalsymlinkmycli="ap_func_rm_global_symlink_mycli"
ap_func_rm_global_symlink_mycli() {
    if [ -f "/usr/local/bin/mycli" ]; then
        @logshow "Remove [/usr/local/bin/mycli]\n"
        sudo rm -f "/usr/local/bin/mycli"
    fi
}

alias @setupmycli="ap_func_setup_mycli"
ap_func_setup_mycli() {
    # https://github.com/dbcli/mycli
    @logshow "Install [mycli]\n"
    pip install mycli

    @initmycli
    if alias @createdirstructmycli &>/dev/null; then
        @createdirstructmycli
    fi
}

alias @rmmycli="ap_func_rm_mycli"
ap_func_rm_mycli() {
    @logshow "Remove [mycli]\n"
    pip uninstall mycli

    if alias @rmdirstructmycli &>/dev/null; then
        @rmdirstructmycli
    fi

    if alias @rmglobalsymlinkmycli &>/dev/null; then
        @rmglobalsymlinkmycli
    fi
}

alias @mycli='ap_func_mycli'
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
