alias @initjq="ap_func_init_jq"
ap_func_init_jq() {
    if alias @initjqshare &>/dev/null; then
        @initjqshare
    fi

    if alias @initjqcommon &>/dev/null; then
        @initjqcommon
    fi
}

alias @createdirstructjq="ap_func_create_dirstruct_jq"
ap_func_create_dirstruct_jq() {
    if alias @createdirstructjqshare &>/dev/null; then
        @createdirstructjqshare
    fi

    if alias @createdirstructjqcommon &>/dev/null; then
        @createdirstructjqcommon
    fi
}

alias @setupjq="ap_func_setup_jq"
ap_func_setup_jq() {
    # https://github.com/stedolan/jq
    @logshow "Install [jq]\n"

    if [ "${AP_OS_TYPE}" == "${AP_OS_TYPE_MACOS}" ]; then
        curl -SL "https://github.com/stedolan/jq/releases/download/jq-1.7/jq-osx-amd64" >"${AP_SOFT_DIR}/bin/jq"
        # brew install jq
    elif [ "${AP_OS_TYPE}" == "${AP_OS_TYPE_UBUNTU}" ]; then
        curl -SL "https://github.com/stedolan/jq/releases/download/jq-1.7/jq-linux64" >"${AP_SOFT_DIR}/bin/jq"
        # chmod +x "${AP_SOFT_DIR}/bin/jq"
    fi

    chmod +x "${AP_SOFT_DIR}/bin/jq"

    @initjq
    if alias @createdirstructjq &>/dev/null; then
        @createdirstructjq
    fi
}

alias @rmjq="ap_func_rm_jq"
ap_func_rm_jq() {
    @logshow "Remove [jq]\n"
    rm -f "${AP_SOFT_DIR}/bin/jq"

    if alias @rmdirstructjq &>/dev/null; then
        @rmdirstructjq
    fi

    if alias @rmglobalsymlinkjq &>/dev/null; then
        @rmglobalsymlinkjq
    fi
}
