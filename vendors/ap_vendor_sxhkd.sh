alias apinitsxhkd="ap_func_init_sxhkd"
ap_func_init_sxhkd() {
    if alias apinitsxhkdshare &>/dev/null; then
        apinitsxhkdshare
    fi

    if alias apinitsxhkdcommon &>/dev/null; then
        apinitsxhkdcommon
    fi
}

alias apcreatedirstructsxhkd="ap_func_create_dirstruct_sxhkd"
ap_func_create_dirstruct_sxhkd() {
    if alias apcreatedirstructsxhkdshare &>/dev/null; then
        apcreatedirstructsxhkdshare
    fi

    if alias apcreatedirstructsxhkdcommon &>/dev/null; then
        apcreatedirstructsxhkdcommon
    fi
}

alias aprmdirstructsxhkd="ap_func_rm_dirstruct_sxhkd"
ap_func_rm_dirstruct_sxhkd() {
    if alias aprmdirstructsxhkdshare &>/dev/null; then
        aprmdirstructsxhkdshare
    fi

    if alias aprmdirstructsxhkdcommon &>/dev/null; then
        aprmdirstructsxhkdcommon
    fi
}

alias apsetupsxhkd="ap_func_setup_sxhkd"
ap_func_setup_sxhkd() {
    # https://github.com/baskerville/sxhkd
    aplogshow "Install required libraries [libxcb-keysyms1-dev, libxcb-util0-dev, apt-file]\n"
    sudo apt update
    sudo apt install -y libxcb-keysyms1-dev libxcb-util0-dev apt-file

    aplogshow "Install [sxhkd]\n"
    rm -rf "${AP_SOFT_DIR}/sxhkd"
    cd "${AP_SOFT_DIR}"
    git clone "https://github.com/baskerville/sxhkd"

    cd "${AP_SOFT_DIR}/sxhkd"
    sudo make
    sudo make install

    apinitsxhkd
    if alias apcreatedirstructsxhkd &>/dev/null; then
        apcreatedirstructsxhkd
    fi
}

alias aprmsxhkd="ap_func_rm_sxhkd"
ap_func_rm_sxhkd() {
    aplogshow "You can remove these libraries manually [libxcb-keysyms1-dev, libxcb-util0-dev, apt-file] if needed\n"
    aplogshow "Remove [sxhkd]\n"

    cd "${AP_SOFT_DIR}/sxhkd"
    sudo make uninstall
    cd "${AP_SOFT_DIR}"
    rm -rf "${AP_SOFT_DIR}/sxhkd"

    if alias aprmdirstructsxhkd &>/dev/null; then
        aprmdirstructsxhkd
    fi

    if alias aprmglobalsymlinksxhkd &>/dev/null; then
        aprmglobalsymlinksxhkd
    fi
}
