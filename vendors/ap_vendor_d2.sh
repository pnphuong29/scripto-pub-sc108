alias apinitd2="ap_func_init_d2"
ap_func_init_d2() {
    if alias apinitd2share &>/dev/null; then
        apinitd2share
    fi

    if alias apinitd2common &>/dev/null; then
        apinitd2common
    fi

    if alias apinitd2main &>/dev/null; then
        apinitd2main
    fi
}

alias apcreatedirstructd2="ap_func_create_dirstruct_d2"
ap_func_create_dirstruct_d2() {
    if alias apcreatedirstructd2share &>/dev/null; then
        apcreatedirstructd2share
    fi

    if alias apcreatedirstructd2common &>/dev/null; then
        apcreatedirstructd2common
    fi

    if alias apcreatedirstructd2main &>/dev/null; then
        apcreatedirstructd2main
    fi
}

alias aprmdirstructd2="ap_func_rm_dirstruct_d2"
ap_func_rm_dirstruct_d2() {
    if alias aprmdirstructd2share &>/dev/null; then
        aprmdirstructd2share
    fi

    if alias aprmdirstructd2common &>/dev/null; then
        aprmdirstructd2common
    fi

    if alias aprmdirstructd2main &>/dev/null; then
        aprmdirstructd2main
    fi
}

alias apsetupd2="ap_func_setup_d2"
ap_func_setup_d2() {
    # https://github.com/terrastruct/d2/blob/master/docs/INSTALL.md
    aplogshow "Install [d2]\n"

    if [ "${AP_OS_TYPE}" == "${AP_OS_TYPE_MACOS}" ]; then
        brew install d2
    elif [ "${AP_OS_TYPE}" == "${AP_OS_TYPE_UBUNTU}" ]; then
        go install oss.terrastruct.com/d2@latest
    fi

    apinitd2
    if alias apcreatedirstructd2 &>/dev/null; then
        apcreatedirstructd2
    fi
}

alias aprmd2="ap_func_rm_d2"
ap_func_rm_d2() {
    aplogshow "Remove [d2]\n"

    if [ "${AP_OS_TYPE}" == "${AP_OS_TYPE_MACOS}" ]; then
        brew remove --cask d2
    elif [ "${AP_OS_TYPE}" == "${AP_OS_TYPE_UBUNTU}" ]; then
        rm -rf "${GOPATH}/pkg/mod/oss.terrastruct.com/d2@"*
    fi

    if alias aprmdirstructd2 &>/dev/null; then
        aprmdirstructd2
    fi

    if alias aprmglobalsymlinkd2 &>/dev/null; then
        aprmglobalsymlinkd2
    fi
}
