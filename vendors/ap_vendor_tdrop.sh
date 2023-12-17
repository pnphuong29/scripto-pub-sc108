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

alias @rmtdrop="ap_func_remove_tdrop"
ap_func_remove_tdrop() {
    @logshow "Remove [tdrop]\n"

    cd "${AP_SOFT_DIR}/tdrop"
    sudo make uninstall

    if alias @rmdirstructtdrop &>/dev/null; then
        @rmdirstructtdrop
    fi
}
