alias apinitjust="ap_func_init_just"
ap_func_init_just() {
    if alias apinitjustshare &>/dev/null; then
        apinitjustshare
    fi

    if alias apinitjustcommon &>/dev/null; then
        apinitjustcommon
    fi
}

alias apcreatedirstructjust="ap_func_create_dirstruct_just"
ap_func_create_dirstruct_just() {
    if alias apcreatedirstructjustshare &>/dev/null; then
        apcreatedirstructjustshare
    fi

    if alias apcreatedirstructjustcommon &>/dev/null; then
        apcreatedirstructjustcommon
    fi
}

alias aprmdirstructjust="ap_func_rm_dirstruct_just"
ap_func_rm_dirstruct_just() {
    if alias aprmdirstructjustshare &>/dev/null; then
        aprmdirstructjustshare
    fi

    if alias aprmdirstructjustcommon &>/dev/null; then
        aprmdirstructjustcommon
    fi
}

alias apcreateglobalsymlinkjust="ap_func_create_global_symlink_just"
ap_func_create_global_symlink_just() {
    if [ -f "${AP_SOFT_DIR}/bin/just" ]; then
        aplogshow "Create symlink from [/usr/local/bin/just] to [${AP_SOFT_DIR}/bin/just]\n"
        sudo ln -sf "${AP_SOFT_DIR}/bin/just" "/usr/local/bin/just"
    fi
}

alias aprmglobalsymlinkjust="ap_func_rm_global_symlink_just"
ap_func_rm_global_symlink_just() {
    if [ -f "/usr/local/bin/just" ]; then
        aplogshow "Remove [/usr/local/bin/just]\n"
        sudo rm -f "/usr/local/bin/just"
    fi
}

alias apsetupjust="ap_func_setup_just"
ap_func_setup_just() {
    # https://github.com/casey/just
    aplogshow "Install [just]\n"
    curl --proto '=https' --tlsv1.2 -sSf https://just.systems/install.sh | bash -s -- --to "${AP_SOFT_DIR}/bin"

    apinitjust
    if alias apcreatedirstructjust &>/dev/null; then
        apcreatedirstructjust
    fi
}

alias aprmjust="ap_func_rm_just"
ap_func_rm_just() {
    aplogshow "Remove [just]\n"
    rm -f "${AP_SOFT_DIR}/bin/just"

    if alias aprmdirstructjust &>/dev/null; then
        aprmdirstructjust
    fi

    if alias aprmglobalsymlinkjust &>/dev/null; then
        aprmglobalsymlinkjust
    fi
}
