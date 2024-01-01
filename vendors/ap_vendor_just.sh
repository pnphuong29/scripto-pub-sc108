alias @initjust="ap_func_init_just"
ap_func_init_just() {
    if alias @initjustshare &>/dev/null; then
        @initjustshare
    fi

    if alias @initjustcommon &>/dev/null; then
        @initjustcommon
    fi
}

alias @createdirstructjust="ap_func_create_dirstruct_just"
ap_func_create_dirstruct_just() {
    if alias @createdirstructjustshare &>/dev/null; then
        @createdirstructjustshare
    fi

    if alias @createdirstructjustcommon &>/dev/null; then
        @createdirstructjustcommon
    fi
}

alias @rmdirstructjust="ap_func_rm_dirstruct_just"
ap_func_rm_dirstruct_just() {
    if alias @rmdirstructjustshare &>/dev/null; then
        @rmdirstructjustshare
    fi

    if alias @rmdirstructjustcommon &>/dev/null; then
        @rmdirstructjustcommon
    fi
}

alias @createglobalsymlinkjust="ap_func_create_global_symlink_just"
ap_func_create_global_symlink_just() {
    if [ -f "${AP_SOFT_DIR}/bin/just" ]; then
        @logshow "Create symlink from [/usr/local/bin/just] to [${AP_SOFT_DIR}/bin/just]\n"
        sudo ln -sf "${AP_SOFT_DIR}/bin/just" "/usr/local/bin/just"
    fi
}

alias @rmglobalsymlinkjust="ap_func_rm_global_symlink_just"
ap_func_rm_global_symlink_just() {
    if [ -f "/usr/local/bin/just" ]; then
        @logshow "Remove [/usr/local/bin/just]\n"
        sudo rm -f "/usr/local/bin/just"
    fi
}

alias @setupjust="ap_func_setup_just"
ap_func_setup_just() {
    # https://github.com/casey/just
    @logshow "Install [just]\n"
    curl --proto '=https' --tlsv1.2 -sSf https://just.systems/install.sh | bash -s -- --to "${AP_SOFT_DIR}/bin"

    @initjust
    if alias @createdirstructjust &>/dev/null; then
        @createdirstructjust
    fi
}

alias @rmjust="ap_func_rm_just"
ap_func_rm_just() {
    @logshow "Remove [just]\n"
    rm -f "${AP_SOFT_DIR}/bin/just"

    if alias @rmdirstructjust &>/dev/null; then
        @rmdirstructjust
    fi

    if alias @rmglobalsymlinkjust &>/dev/null; then
        @rmglobalsymlinkjust
    fi
}
