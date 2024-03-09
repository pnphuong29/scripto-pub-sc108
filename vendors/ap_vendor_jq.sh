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

alias rmjq="ap_func_rm_jq"
ap_func_rm_jq() {
    aplogshow "Remove [jq]\n"
    rm -f "${AP_SOFT_DIR}/bin/jq"

    if alias rmdirstructjq &>/dev/null; then
        rmdirstructjq
    fi

    if alias rmglobalsymlinkjq &>/dev/null; then
        rmglobalsymlinkjq
    fi
}
