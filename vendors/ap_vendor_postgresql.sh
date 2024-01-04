alias @initpostgresql="ap_func_init_postgresql"
ap_func_init_postgresql() {
    if alias @initpostgresqlshare &>/dev/null; then
        @initpostgresqlshare
    fi

    if alias @initpostgresqlcommon &>/dev/null; then
        @initpostgresqlcommon
    fi
}

alias @createdirstructpostgresql="ap_func_create_dirstruct_postgresql"
ap_func_create_dirstruct_postgresql() {
    if alias @createdirstructpostgresqlshare &>/dev/null; then
        @createdirstructpostgresqlshare
    fi

    if alias @createdirstructpostgresqlcommon &>/dev/null; then
        @createdirstructpostgresqlcommon
    fi
}

alias @rmdirstructpostgresql="ap_func_rm_dirstruct_postgresql"
ap_func_rm_dirstruct_postgresql() {
    if alias @rmdirstructpostgresqlshare &>/dev/null; then
        @rmdirstructpostgresqlshare
    fi

    if alias @rmdirstructpostgresqlcommon &>/dev/null; then
        @rmdirstructpostgresqlcommon
    fi
}

alias @setuppostgresql="ap_func_setup_postgresql"
ap_func_setup_postgresql() {
    # https://www.postgresql.org/download/linux/
    # https://www.postgresql.org/download/macosx/
    @logshow "Install [PostgreSQL]\n"

    if [ "${AP_OS_TYPE}" == "${AP_OS_TYPE_MACOS}" ]; then
        brew install postgresql@15
    elif [ "${AP_OS_TYPE}" == "${AP_OS_TYPE_UBUNTU}" ]; then
        sudo sh -c 'echo "deb http://apt.postgresql.org/pub/repos/apt $(lsb_release -cs)-pgdg main" > /etc/apt/sources.list.d/pgdg.list'
        wget --quiet -O - https://www.postgresql.org/media/keys/ACCC4CF8.asc | sudo apt-key add -
        sudo apt update
        sudo apt install -y postgresql

        local ap_pgsql_major_version
        ap_pgsql_major_version="$(psql --version | cut -d ' ' -f 3 | cut -d . -f 1)"
        sudo apt install -y "postgresql-server-dev-${ap_pgsql_major_version}"
    fi

    @initpostgresql
    if alias @createdirstructpostgresql &>/dev/null; then
        @createdirstructpostgresql
    fi
}

alias @rmpostgresql="ap_func_rm_postgresql"
ap_func_rm_postgresql() {
    @logshow "Remove [PostgreSQL]\n"

    if [ "${AP_OS_TYPE}" == "${AP_OS_TYPE_MACOS}" ]; then
        brew uninstall postgresql
    elif [ "${AP_OS_TYPE}" == "${AP_OS_TYPE_UBUNTU}" ]; then
        local ap_pgsql_major_version
        ap_pgsql_major_version="$(psql --version | cut -d ' ' -f 3 | cut -d . -f 1)"
        sudo apt purge -y postgresql "postgresql-server-dev-${ap_pgsql_major_version}"
    fi

    if alias @rmdirstructpostgresql &>/dev/null; then
        @rmdirstructpostgresql
    fi

    if alias @rmglobalsymlinkpostgresql &>/dev/null; then
        @rmglobalsymlinkpostgresql
    fi
}
