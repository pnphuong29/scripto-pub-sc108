alias apinitunison="ap_func_init_unison"
ap_func_init_unison() {
    alias initunisonconfig="cp \${HOME}/scripto-common/vendors/unison/test.prf \${HOME}/.unison/"
    alias unisonpc7="unison ~/Downloads ssh://pnphuong29@mahakaruna.ddns.inf:8022//home/pnphuong29/Downloads/test"

    if alias apinitunisonshare &>/dev/null; then
        apinitunisonshare
    fi

    if alias apinitunisoncommon &>/dev/null; then
        apinitunisoncommon
    fi

    if alias apinitunisonmain &>/dev/null; then
        apinitunisonmain
    fi
}

alias apcreatedirstructunison="ap_func_create_dirstruct_unison"
ap_func_create_dirstruct_unison() {
    apshowmsginfo "Create unison directories at [${HOME}/.unison]\n"
    mkdir -p "${HOME}/.unison"

    if alias apcreatedirstructunisonshare &>/dev/null; then
        apcreatedirstructunisonshare
    fi

    if alias apcreatedirstructunisoncommon &>/dev/null; then
        apcreatedirstructunisoncommon
    fi

    if alias apcreatedirstructunisonmain &>/dev/null; then
        apcreatedirstructunisonmain
    fi
}

alias aprmdirstructunison="ap_func_rm_dirstruct_unison"
ap_func_rm_dirstruct_unison() {
    apshowmsginfo "Remove [${HOME}/.unison/]\n"
    rm -f "${HOME}/.unison/"

    if alias aprmdirstructunisonshare &>/dev/null; then
        aprmdirstructunisonshare
    fi

    if alias aprmdirstructunisoncommon &>/dev/null; then
        aprmdirstructunisoncommon
    fi

    if alias aprmdirstructunisonmain &>/dev/null; then
        aprmdirstructunisonmain
    fi
}

alias apsetupunison="ap_func_setup_unison"
ap_func_setup_unison() {
    apshowmsginfo "Install [unison]\n"

    if [ "${AP_OS_TYPE}" == "${AP_OS_TYPE_MACOS}" ]; then
        brew install unison
    elif [ "${AP_OS_TYPE}" == "${AP_OS_TYPE_UBUNTU}" ]; then
        sudo apt install -y unison
    fi

    apinitunison
    if alias apcreatedirstructunison &>/dev/null; then
        apcreatedirstructunison
    fi
}

alias aprmunison="ap_func_rm_unison"
ap_func_rm_unison() {
    apshowmsginfo "Remove [unison]\n"

    if [ "${AP_OS_TYPE}" == "${AP_OS_TYPE_MACOS}" ]; then
        brew remove unison
    elif [ "${AP_OS_TYPE}" == "${AP_OS_TYPE_UBUNTU}" ]; then
        sudo apt remove --purge -y unison
        sudo apt autoremove --purge -y
    fi

    if alias aprmdirstructunison &>/dev/null; then
        aprmdirstructunison
    fi

    if alias aprmglobalsymlinkunison &>/dev/null; then
        aprmglobalsymlinkunison
    fi
}
