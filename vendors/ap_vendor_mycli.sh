alias apinitmycli="ap_func_init_mycli"
ap_func_init_mycli() {
    if alias apinitmyclishare &>/dev/null; then
        apinitmyclishare
    fi

    if alias apinitmyclicommon &>/dev/null; then
        apinitmyclicommon
    fi
}

alias apcreatedirstructmycli="ap_func_create_dirstruct_mycli"
ap_func_create_dirstruct_mycli() {
    if alias apcreatedirstructmyclishare &>/dev/null; then
        apcreatedirstructmyclishare
    fi

    if alias apcreatedirstructmyclicommon &>/dev/null; then
        apcreatedirstructmyclicommon
    fi
}

alias aprmdirstructmycli="ap_func_rm_dirstruct_mycli"
ap_func_rm_dirstruct_mycli() {
    if alias aprmdirstructmyclishare &>/dev/null; then
        aprmdirstructmyclishare
    fi

    if alias aprmdirstructmyclicommon &>/dev/null; then
        aprmdirstructmyclicommon
    fi
}

# alias apcreateglobalsymlinkmycli="ap_func_create_global_symlink_mycli"
# ap_func_create_global_symlink_mycli() {
#     if [ -f "${AP_SOFT_DIR}/bin/mycli" ]; then
#         aplogshow "Create symlink from [/usr/local/bin/mycli] to [${AP_SOFT_DIR}/bin/mycli]\n"
#         sudo ln -sf "${AP_SOFT_DIR}/bin/mycli" "/usr/local/bin/mycli"
#     fi
# }

# alias aprmglobalsymlinkmycli="ap_func_rm_global_symlink_mycli"
# ap_func_rm_global_symlink_mycli() {
#     if [ -f "/usr/local/bin/mycli" ]; then
#         aplogshow "Remove [/usr/local/bin/mycli]\n"
#         sudo rm -f "/usr/local/bin/mycli"
#     fi
# }

alias apsetupmycli="ap_func_setup_mycli"
ap_func_setup_mycli() {
    # https://github.com/dbcli/mycli
    aplogshow "Install [mycli]\n"
    # pip install mycli
    uv tool install mycli

    apinitmycli
    if alias apcreatedirstructmycli &>/dev/null; then
        apcreatedirstructmycli
    fi
}

alias aprmmycli="ap_func_rm_mycli"
ap_func_rm_mycli() {
    aplogshow "Remove [mycli]\n"
    # pip uninstall mycli
    uv tool uninstall mycli

    if alias aprmdirstructmycli &>/dev/null; then
        aprmdirstructmycli
    fi

    if alias aprmglobalsymlinkmycli &>/dev/null; then
        aprmglobalsymlinkmycli
    fi
}

alias myclif='ap_func_mycli'
# @$func $$ ap_func_mycli {
# ap_func_mycli *<host> *<port> *<user> *<pass> <db>
# Description
# 	Quickly connect to MySQL DB using short syntax
# Return status
#	AP_CODE_SUCCESS
# }
ap_func_mycli() {
    if [ "$#" -lt 4 ]; then
        rtn_error_not_enough_arguments
    fi

    local ap_host="$1"
    local ap_port="$2"
    local ap_user="$3"
    local ap_pass="$4"
    local ap_db=""

    if [ -n "$5" ]; then
        ap_db="$5"
        apshowmsginfo "Execute [mycli -h \"${ap_host}\" -P \"${ap_port}\" -u \"${ap_user}\" -p \"${ap_pass}\" -D \"${ap_db}\"]\n"
        mycli -h "${ap_host}" -P "${ap_port}" -u "${ap_user}" -p "${ap_pass}" -D "${ap_db}"
    else
        apshowmsginfo "Execute [mycli -h \"${ap_host}\" -P \"${ap_port}\" -u \"${ap_user}\" -p \"${ap_pass}\"]\n"
        mycli -h "${ap_host}" -P "${ap_port}" -u "${ap_user}" -p "${ap_pass}"
    fi

    aprtn_success
}
