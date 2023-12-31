alias @setupsqlite="ap_func_setup_sqlite"
ap_func_setup_sqlite() {
    @logshow "Install [sqlite]\n"
    # https://sqlite.org/download.html
    # brew install sqlite
    local ap_os_type="osx"
    if [ "${AP_OS_TYPE}" == "${AP_OS_TYPE_UBUNTU}" ]; then
        ap_os_type="linux"
    fi

    rm -rf "${AP_TMP_DIR}/sqlite"
    mkdir -p "${AP_TMP_DIR}/sqlite"
    cd "${AP_TMP_DIR}/sqlite"
    curl -SOL "https://www.sqlite.org/2023/sqlite-tools-${ap_os_type}-x64-3440200.zip"
    unzip "sqlite-tools-${ap_os_type}-x64-3440200.zip"
    rm -f "sqlite-tools-${ap_os_type}-x64-3440200.zip"

    rm -rf "${AP_SOFT_DIR}/sqlite"
    cd "${AP_SOFT_DIR}"
    mv "${AP_TMP_DIR}/sqlite" "${AP_SOFT_DIR}/"
}

alias @rmsqlite="ap_func_rm_sqlite"
ap_func_rm_sqlite() {
    @logshow "Remove [sqlite]\n"
    # https://sqlite.org/download.html
    # brew uninstall sqlite
    rm -rf "${AP_SOFT_DIR}/sqlite"
}
