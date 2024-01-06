alias @initsxhkd="ap_func_init_sxhkd"
ap_func_init_sxhkd() {
    if alias @initsxhkdshare &>/dev/null; then
        @initsxhkdshare
    fi

    if alias @initsxhkdcommon &>/dev/null; then
        @initsxhkdcommon
    fi
}

alias @createdirstructsxhkd="ap_func_create_dirstruct_sxhkd"
ap_func_create_dirstruct_sxhkd() {
    if alias @createdirstructsxhkdshare &>/dev/null; then
        @createdirstructsxhkdshare
    fi

    if alias @createdirstructsxhkdcommon &>/dev/null; then
        @createdirstructsxhkdcommon
    fi
}

alias @rmdirstructsxhkd="ap_func_rm_dirstruct_sxhkd"
ap_func_rm_dirstruct_sxhkd() {
    if alias @rmdirstructsxhkdshare &>/dev/null; then
        @rmdirstructsxhkdshare
    fi

    if alias @rmdirstructsxhkdcommon &>/dev/null; then
        @rmdirstructsxhkdcommon
    fi
}

alias @setupsxhkd="ap_func_setup_sxhkd"
ap_func_setup_sxhkd() {
    # https://github.com/baskerville/sxhkd
    @logshow "Install required libraries [libxcb-keysyms1-dev, libxcb-util0-dev, apt-file]\n"
    sudo apt update
    sudo apt install -y libxcb-keysyms1-dev libxcb-util0-dev apt-file

    @logshow "Install [sxhkd]\n"
    rm -rf "${AP_SOFT_DIR}/sxhkd"
    cd "${AP_SOFT_DIR}"
    git clone "https://github.com/baskerville/sxhkd"

    cd "${AP_SOFT_DIR}/sxhkd"
    sudo make
    sudo make install

    @initsxhkd
    if alias @createdirstructsxhkd &>/dev/null; then
        @createdirstructsxhkd
    fi
}

alias @rmsxhkd="ap_func_rm_sxhkd"
ap_func_rm_sxhkd() {
    @logshow "You can remove these libraries manually [libxcb-keysyms1-dev, libxcb-util0-dev, apt-file] if needed\n"
    @logshow "Remove [sxhkd]\n"

    cd "${AP_SOFT_DIR}/sxhkd"
    sudo make uninstall
    cd "${AP_SOFT_DIR}"
    rm -rf "${AP_SOFT_DIR}/sxhkd"

    if alias @rmdirstructsxhkd &>/dev/null; then
        @rmdirstructsxhkd
    fi

    if alias @rmglobalsymlinksxhkd &>/dev/null; then
        @rmglobalsymlinksxhkd
    fi
}
