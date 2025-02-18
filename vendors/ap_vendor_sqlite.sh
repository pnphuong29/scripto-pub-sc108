alias apinitsqlite="ap_func_init_sqlite"
ap_func_init_sqlite() {
    if alias apinitsqliteshare &>/dev/null; then
        apinitsqliteshare
    fi

    if alias apinitsqlitecommon &>/dev/null; then
        apinitsqlitecommon
    fi
}

alias apcreatedirstructsqlite="ap_func_create_dirstruct_sqlite"
ap_func_create_dirstruct_sqlite() {
    if alias apcreatedirstructsqliteshare &>/dev/null; then
        apcreatedirstructsqliteshare
    fi

    if alias apcreatedirstructsqlitecommon &>/dev/null; then
        apcreatedirstructsqlitecommon
    fi
}

alias aprmdirstructsqlite="ap_func_rm_dirstruct_sqlite"
ap_func_rm_dirstruct_sqlite() {
    if alias aprmdirstructsqliteshare &>/dev/null; then
        aprmdirstructsqliteshare
    fi

    if alias aprmdirstructsqlitecommon &>/dev/null; then
        aprmdirstructsqlitecommon
    fi
}

alias apsetupsqlite="ap_func_setup_sqlite"
ap_func_setup_sqlite() {
    # https://sqlite.org/download.html
    aplogshow "Install [sqlite]\n"

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

    apinitsqlite
    if alias apcreatedirstructsqlite &>/dev/null; then
        apcreatedirstructsqlite
    fi
}

alias aprmsqlite="ap_func_rm_sqlite"
ap_func_rm_sqlite() {
    aplogshow "Remove [sqlite]\n"
    # brew uninstall sqlite
    rm -rf "${AP_SOFT_DIR}/sqlite"

    if alias aprmdirstructsqlite &>/dev/null; then
        aprmdirstructsqlite
    fi

    if alias aprmglobalsymlinksqlite &>/dev/null; then
        aprmglobalsymlinksqlite
    fi
}
