# https://www.postgresql.org/download/linux/
# https://www.postgresql.org/download/macosx/
alias apinitpostgresql="ap_func_init_postgresql"
ap_func_init_postgresql() {
    export AP_PG_SETUP_VERSION='16'

    if alias apinitpostgresqlshare &>/dev/null; then
        apinitpostgresqlshare
    fi

    if alias apinitpostgresqlcommon &>/dev/null; then
        apinitpostgresqlcommon
    fi
}

alias apcreatedirstructpostgresql="ap_func_create_dirstruct_postgresql"
ap_func_create_dirstruct_postgresql() {
    if alias apcreatedirstructpostgresqlshare &>/dev/null; then
        apcreatedirstructpostgresqlshare
    fi

    if alias apcreatedirstructpostgresqlcommon &>/dev/null; then
        apcreatedirstructpostgresqlcommon
    fi
}

alias aprmdirstructpostgresql="ap_func_rm_dirstruct_postgresql"
ap_func_rm_dirstruct_postgresql() {
    if alias aprmdirstructpostgresqlshare &>/dev/null; then
        aprmdirstructpostgresqlshare
    fi

    if alias aprmdirstructpostgresqlcommon &>/dev/null; then
        aprmdirstructpostgresqlcommon
    fi
}

alias apsetuppostgresql="ap_func_setup_postgresql"
ap_func_setup_postgresql() {
    local ap_pg_setup_version="${AP_PG_SETUP_VERSION}"
    if [ -n "$1" ]; then
        ap_pg_setup_version="$1"
    fi

    apshowmsginfo "Install [PostgreSQL] version [${ap_pg_setup_version}]\n"

    if [ "${AP_OS_TYPE}" == "${AP_OS_TYPE_MACOS}" ]; then
        brew install "postgresql@${ap_pg_setup_version}"
    elif [ "${AP_OS_TYPE}" == "${AP_OS_TYPE_UBUNTU}" ]; then
        sudo apt install -y "postgresql-${ap_pg_setup_version}"
        # sudo sh -c 'echo "deb http://apt.postgresql.org/pub/repos/apt $(lsb_release -cs)-pgdg main" > /etc/apt/sources.list.d/pgdg.list'
        # wget --quiet -O - https://www.postgresql.org/media/keys/ACCC4CF8.asc | sudo apt-key add -
        # sudo apt update
        # sudo apt install -y postgresql

        # local ap_pgsql_major_version
        # ap_pgsql_major_version="$(psql --version | cut -d ' ' -f 3 | cut -d . -f 1)"
        # sudo apt install -y "postgresql-server-dev-${ap_pgsql_major_version}"
    fi

    apinitpostgresql
    if alias apcreatedirstructpostgresql &>/dev/null; then
        apcreatedirstructpostgresql
    fi
}

alias aprmpostgresql="ap_func_rm_postgresql"
ap_func_rm_postgresql() {
    local ap_pg_remove_version="${AP_PG_SETUP_VERSION}"
    if [ -n "$1" ]; then
        ap_pg_remove_version="$1"
    fi

    apshowmsginfo "Remove [PostgreSQL] v${ap_pg_remove_version}\n"

    if [ "${AP_OS_TYPE}" == "${AP_OS_TYPE_MACOS}" ]; then
        brew uninstall "postgresql@${ap_pg_remove_version}"
    elif [ "${AP_OS_TYPE}" == "${AP_OS_TYPE_UBUNTU}" ]; then
        local ap_pgsql_major_version
        ap_pgsql_major_version="$(psql --version | cut -d ' ' -f 3 | cut -d . -f 1)"
        sudo apt purge -y postgresql "postgresql-server-dev-${ap_pgsql_major_version}"
    fi

    if alias aprmdirstructpostgresql &>/dev/null; then
        aprmdirstructpostgresql
    fi

    if alias aprmglobalsymlinkpostgresql &>/dev/null; then
        aprmglobalsymlinkpostgresql
    fi
}
