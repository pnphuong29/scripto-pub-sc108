alias @initmicro="ap_func_init_micro"
ap_func_init_micro() {
    export MICRO_CONFIG_HOME="${HOME}/.config/micro"
    alias zmicroconf="cd \${HOME}/.config/micro"

    if alias @initmicroshare &>/dev/null; then
        @initmicroshare
    fi

    if alias @initmicrocommon &>/dev/null; then
        @initmicrocommon
    fi
}

alias @createdirstructmicro="ap_func_create_dirstruct_micro"
ap_func_create_dirstruct_micro() {
    if alias @createdirstructmicroshare &>/dev/null; then
        @createdirstructmicroshare
    fi

    if alias @createdirstructmicrocommon &>/dev/null; then
        @createdirstructmicrocommon
    fi
}

alias @rmdirstructmicro="ap_func_rm_dirstruct_micro"
ap_func_rm_dirstruct_micro() {
    if alias @rmdirstructmicroshare &>/dev/null; then
        @rmdirstructmicroshare
    fi

    if alias @rmdirstructmicrocommon &>/dev/null; then
        @rmdirstructmicrocommon
    fi
}

alias @createglobalsymlinkmicro="ap_func_create_global_symlink_micro"
ap_func_create_global_symlink_micro() {
    if [ -f "${AP_SOFT_DIR}/bin/micro" ]; then
        @logshow "Create symlink from [/usr/local/bin/micro] to [${AP_SOFT_DIR}/bin/micro]\n"
        sudo ln -sf "${AP_SOFT_DIR}/bin/micro" "/usr/local/bin/micro"
    fi
}

alias @rmglobalsymlinkmicro="ap_func_rm_global_symlink_micro"
ap_func_rm_global_symlink_micro() {
    if [ -f "/usr/local/bin/micro" ]; then
        @logshow "Remove [/usr/local/bin/micro]\n"
        sudo rm -f "/usr/local/bin/micro"
    fi
}

alias @setupmicro="ap_func_setup_micro"
ap_func_setup_micro() {
    # https://micro-editor.github.io/
    @logshow "Install [micro]\n"

    cd "${AP_TMP_DIR}"
    curl https://getmic.ro | bash
    mv micro "${AP_SOFT_DIR}/bin/"

    @initmicro
    if alias @createdirstructmicro &>/dev/null; then
        @createdirstructmicro
    fi

    if alias @createglobalsymlinkmicro &>/dev/null; then
        @createglobalsymlinkmicro
    fi
}

alias @rmmicro="ap_func_rm_micro"
ap_func_rm_micro() {
    @logshow "Remove [micro]\n"
    rm -f "${AP_SOFT_DIR}/bin/micro"

    if alias @rmdirstructmicro &>/dev/null; then
        @rmdirstructmicro
    fi

    if alias @rmglobalsymlinkmicro &>/dev/null; then
        @rmglobalsymlinkmicro
    fi
}
