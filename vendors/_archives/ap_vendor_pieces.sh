alias apinitpieces="ap_func_init_pieces"
ap_func_init_pieces() {
    if alias apinitpiecesshare &>/dev/null; then
        apinitpiecesshare
    fi

    if alias apinitpiecescommon &>/dev/null; then
        apinitpiecescommon
    fi

    if alias apinitpiecesmain &>/dev/null; then
        apinitpiecesmain
    fi
}

alias apcreatedirstructpieces="ap_func_create_dirstruct_pieces"
ap_func_create_dirstruct_pieces() {
    if alias apcreatedirstructpiecesshare &>/dev/null; then
        apcreatedirstructpiecesshare
    fi

    if alias apcreatedirstructpiecescommon &>/dev/null; then
        apcreatedirstructpiecescommon
    fi

    if alias apcreatedirstructpiecesmain &>/dev/null; then
        apcreatedirstructpiecesmain
    fi
}

alias aprmdirstructpieces="ap_func_rm_dirstruct_pieces"
ap_func_rm_dirstruct_pieces() {
    if alias aprmdirstructpiecesshare &>/dev/null; then
        aprmdirstructpiecesshare
    fi

    if alias aprmdirstructpiecescommon &>/dev/null; then
        aprmdirstructpiecescommon
    fi

    if alias aprmdirstructpiecesmain &>/dev/null; then
        aprmdirstructpiecesmain
    fi
}

alias apsetuppieces="ap_func_setup_pieces"
ap_func_setup_pieces() {
    aplogshow "Install [pieces]\n"

    if [ "${AP_OS_TYPE}" == "${AP_OS_TYPE_MACOS}" ]; then
        brew install --cask pieces
    elif [ "${AP_OS_TYPE}" == "${AP_OS_TYPE_UBUNTU}" ]; then
        sudo snap install pieces-os
        sudo snap connect pieces-os:process-control :process-control
        sudo snap install pieces-for-developers
    fi

    pieces-os
    apinitpieces
    if alias apcreatedirstructpieces &>/dev/null; then
        apcreatedirstructpieces
    fi
}

alias aprmpieces="ap_func_rm_pieces"
ap_func_rm_pieces() {
    aplogshow "Remove [pieces]\n"

    if [ "${AP_OS_TYPE}" == "${AP_OS_TYPE_MACOS}" ]; then
        brew remove --cask pieces
    elif [ "${AP_OS_TYPE}" == "${AP_OS_TYPE_UBUNTU}" ]; then
        sudo snap remove --purge pieces-os pieces-for-developers
    fi

    if alias aprmdirstructpieces &>/dev/null; then
        aprmdirstructpieces
    fi

    if alias aprmglobalsymlinkpieces &>/dev/null; then
        aprmglobalsymlinkpieces
    fi
}
