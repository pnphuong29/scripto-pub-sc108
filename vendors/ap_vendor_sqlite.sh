alias @initsqlite="ap_func_init_sqlite"
ap_func_init_sqlite() {
    if alias @initsqliteshare &>/dev/null; then
        @initsqliteshare
    fi

    if alias @initsqlitecommon &>/dev/null; then
        @initsqlitecommon
    fi
}

alias @createdirstructsqlite="ap_func_create_dirstruct_sqlite"
ap_func_create_dirstruct_sqlite() {
    if alias @createdirstructsqliteshare &>/dev/null; then
        @createdirstructsqliteshare
    fi

    if alias @createdirstructsqlitecommon &>/dev/null; then
        @createdirstructsqlitecommon
    fi
}

alias @rmdirstructsqlite="ap_func_rm_dirstruct_sqlite"
ap_func_rm_dirstruct_sqlite() {
    if alias @rmdirstructsqliteshare &>/dev/null; then
        @rmdirstructsqliteshare
    fi

    if alias @rmdirstructsqlitecommon &>/dev/null; then
        @rmdirstructsqlitecommon
    fi
}

alias @setupsqlite="ap_func_setup_sqlite"
ap_func_setup_sqlite() {
    # https://sqlite.org/download.html
    @logshow "Install [sqlite]\n"

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

    @initsqlite
    if alias @createdirstructsqlite &>/dev/null; then
        @createdirstructsqlite
    fi
}

alias @rmsqlite="ap_func_rm_sqlite"
ap_func_rm_sqlite() {
    @logshow "Remove [sqlite]\n"
    # brew uninstall sqlite
    rm -rf "${AP_SOFT_DIR}/sqlite"

    if alias @rmdirstructsqlite &>/dev/null; then
        @rmdirstructsqlite
    fi

    if alias @rmglobalsymlinksqlite &>/dev/null; then
        @rmglobalsymlinksqlite
    fi
}
