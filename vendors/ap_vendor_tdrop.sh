alias apinittdrop="ap_func_init_tdrop"
ap_func_init_tdrop() {
    if alias apinittdropshare &>/dev/null; then
        apinittdropshare
    fi

    if alias apinittdropcommon &>/dev/null; then
        apinittdropcommon
    fi
}

alias apcreatedirstructtdrop="ap_func_create_dirstruct_tdrop"
ap_func_create_dirstruct_tdrop() {
    if alias apcreatedirstructtdropshare &>/dev/null; then
        apcreatedirstructtdropshare
    fi

    if alias apcreatedirstructtdropcommon &>/dev/null; then
        apcreatedirstructtdropcommon
    fi
}

alias rmdirstructtdrop="ap_func_rm_dirstruct_tdrop"
ap_func_rm_dirstruct_tdrop() {
    if alias rmdirstructtdropshare &>/dev/null; then
        rmdirstructtdropshare
    fi

    if alias rmdirstructtdropcommon &>/dev/null; then
        rmdirstructtdropcommon
    fi
}

alias apsetuptdrop="ap_func_setup_tdrop"
ap_func_setup_tdrop() {
    # https://github.com/noctuid/tdrop
    aplogshow "Install [tdrop]\n"

    rm -rf "${AP_SOFT_DIR}/tdrop"
    cd "${AP_SOFT_DIR}"
    git clone "https://github.com/noctuid/tdrop"

    cd "${AP_SOFT_DIR}/tdrop"
    sudo make
    sudo make install

    apinittdrop
    if alias apcreatedirstructtdrop &>/dev/null; then
        apcreatedirstructtdrop
    fi
}

alias rmtdrop="ap_func_rm_tdrop"
ap_func_rm_tdrop() {
    aplogshow "Remove [tdrop]\n"

    cd "${AP_SOFT_DIR}/tdrop"
    sudo make uninstall

    cd "${AP_SOFT_DIR}"
    rm -rf "${AP_SOFT_DIR}/tdrop"

    if alias rmdirstructtdrop &>/dev/null; then
        rmdirstructtdrop
    fi

    if alias rmglobalsymlinktdrop &>/dev/null; then
        rmglobalsymlinktdrop
    fi
}
