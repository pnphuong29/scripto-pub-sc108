alias apinitjq="ap_func_init_jq"
ap_func_init_jq() {
    if alias apinitjqshare &>/dev/null; then
        apinitjqshare
    fi

    if alias apinitjqcommon &>/dev/null; then
        apinitjqcommon
    fi
}

alias apcreatedirstructjq="ap_func_create_dirstruct_jq"
ap_func_create_dirstruct_jq() {
    if alias apcreatedirstructjqshare &>/dev/null; then
        apcreatedirstructjqshare
    fi

    if alias apcreatedirstructjqcommon &>/dev/null; then
        apcreatedirstructjqcommon
    fi
}

alias apcreateglobalsymlinkjq="ap_func_create_global_symlink_jq"
ap_func_create_global_symlink_jq() {
    if [ -f "${AP_SOFT_DIR}/bin/jq" ]; then
        aplogshow "Create symlink from [/usr/local/bin/jq] to [${AP_SOFT_DIR}/bin/jq]\n"
        sudo ln -sf "${AP_SOFT_DIR}/bin/jq" "/usr/local/bin/jq"
    fi
}

alias aprmglobalsymlinkjq="ap_func_rm_global_symlink_jq"
ap_func_rm_global_symlink_jq() {
    if [ -f "/usr/local/bin/jq" ]; then
        aplogshow "Remove [/usr/local/bin/jq]\n"
        sudo rm -f "/usr/local/bin/jq"
    fi
}

alias apsetupjq="ap_func_setup_jq"
ap_func_setup_jq() {
    # https://github.com/stedolan/jq
    aplogshow "Install [jq]\n"

    if [ "${AP_OS_TYPE}" == "${AP_OS_TYPE_MACOS}" ]; then
        curl -SL "https://github.com/stedolan/jq/releases/download/jq-1.7/jq-osx-amd64" >"${AP_SOFT_DIR}/bin/jq"
        # brew install jq
    elif [ "${AP_OS_TYPE}" == "${AP_OS_TYPE_UBUNTU}" ]; then
        curl -SL "https://github.com/stedolan/jq/releases/download/jq-1.7/jq-linux64" >"${AP_SOFT_DIR}/bin/jq"
        # chmod +x "${AP_SOFT_DIR}/bin/jq"
    fi

    chmod +x "${AP_SOFT_DIR}/bin/jq"

    apinitjq
    if alias apcreatedirstructjq &>/dev/null; then
        apcreatedirstructjq
    fi
}

alias aprmjq="ap_func_rm_jq"
ap_func_rm_jq() {
    aplogshow "Remove [jq]\n"
    rm -f "${AP_SOFT_DIR}/bin/jq"

    if alias aprmdirstructjq &>/dev/null; then
        aprmdirstructjq
    fi

    if alias aprmglobalsymlinkjq &>/dev/null; then
        aprmglobalsymlinkjq
    fi
}
