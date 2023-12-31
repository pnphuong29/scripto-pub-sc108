alias @inittdrop="ap_func_init_tdrop"
ap_func_init_tdrop() {
    if alias @inittdropcommon &>/dev/null; then
        @inittdropcommon
    fi
}

alias @createdirstructtdrop="ap_func_create_dirstruct_tdrop"
ap_func_create_dirstruct_tdrop() {
    if alias @createdirstructtdropcommon &>/dev/null; then
        @createdirstructtdropcommon
    fi
}

alias @rmdirstructtdrop="ap_func_rm_dirstruct_tdrop"
ap_func_rm_dirstruct_tdrop() {
    if alias @rmdirstructtdropcommon &>/dev/null; then
        @rmdirstructtdropcommon
    fi
}

alias @setuptdrop="ap_func_setup_tdrop"
ap_func_setup_tdrop() {
    # https://github.com/noctuid/tdrop
    @logshow "Install [tdrop]\n"

    rm -rf "${AP_SOFT_DIR}/tdrop"
    cd "${AP_SOFT_DIR}"
    git clone "https://github.com/noctuid/tdrop"

    cd "${AP_SOFT_DIR}/tdrop"
    sudo make
    sudo make install

    if alias @createdirstructtdrop &>/dev/null; then
        @createdirstructtdrop
    fi
}

alias @rmtdrop="ap_func_rm_tdrop"
ap_func_rm_tdrop() {
    @logshow "Remove [tdrop]\n"

    cd "${AP_SOFT_DIR}/tdrop"
    sudo make uninstall

    if alias @rmdirstructtdrop &>/dev/null; then
        @rmdirstructtdrop
    fi
}
