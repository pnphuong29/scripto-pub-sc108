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
}

alias @rmjq="ap_func_remove_jq"
ap_func_remove_jq() {
    @logshow "Remove [jq]\n"
    rm -f "${AP_SOFT_DIR}/bin/jq"
}
