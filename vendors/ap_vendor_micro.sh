alias apinitmicro="ap_func_init_micro"
ap_func_init_micro() {
    export MICRO_CONFIG_HOME="${HOME}/.config/micro"
    alias zmicroconf="cd \${HOME}/.config/micro"

    if alias apinitmicroshare &>/dev/null; then
        apinitmicroshare
    fi

    if alias apinitmicrocommon &>/dev/null; then
        apinitmicrocommon
    fi
}

alias apcreatedirstructmicro="ap_func_create_dirstruct_micro"
ap_func_create_dirstruct_micro() {
    aplogshow "Create symlink from [${HOME}/.config/micro]\n"
    mkdir -p "${HOME}/.config/micro"

    if alias apcreatedirstructmicroshare &>/dev/null; then
        apcreatedirstructmicroshare
    fi

    if alias apcreatedirstructmicrocommon &>/dev/null; then
        apcreatedirstructmicrocommon
    fi
}

alias aprmdirstructmicro="ap_func_rm_dirstruct_micro"
ap_func_rm_dirstruct_micro() {
    if alias aprmdirstructmicroshare &>/dev/null; then
        aprmdirstructmicroshare
    fi

    if alias aprmdirstructmicrocommon &>/dev/null; then
        aprmdirstructmicrocommon
    fi
}

alias apcreateglobalsymlinkmicro="ap_func_create_global_symlink_micro"
ap_func_create_global_symlink_micro() {
    if [ -f "${AP_SOFT_DIR}/bin/micro" ]; then
        aplogshow "Create symlink from [/usr/local/bin/micro] to [${AP_SOFT_DIR}/bin/micro]\n"
        sudo ln -sf "${AP_SOFT_DIR}/bin/micro" "/usr/local/bin/micro"
    fi
}

alias aprmglobalsymlinkmicro="ap_func_rm_global_symlink_micro"
ap_func_rm_global_symlink_micro() {
    if [ -f "/usr/local/bin/micro" ]; then
        aplogshow "Remove [/usr/local/bin/micro]\n"
        sudo rm -f "/usr/local/bin/micro"
    fi
}

alias apsetupmicro="ap_func_setup_micro"
ap_func_setup_micro() {
    # https://micro-editor.github.io/
    aplogshow "Install [micro]\n"

    cd "${AP_TMP_DIR}"
    curl https://getmic.ro | bash
    mv micro "${AP_SOFT_DIR}/bin/"

    apinitmicro
    if alias apcreatedirstructmicro &>/dev/null; then
        apcreatedirstructmicro
    fi

    if alias apcreateglobalsymlinkmicro &>/dev/null; then
        apcreateglobalsymlinkmicro
    fi
}

alias aprmmicro="ap_func_rm_micro"
ap_func_rm_micro() {
    aplogshow "Remove [micro]\n"
    rm -f "${AP_SOFT_DIR}/bin/micro"

    if alias aprmdirstructmicro &>/dev/null; then
        aprmdirstructmicro
    fi

    if alias aprmglobalsymlinkmicro &>/dev/null; then
        aprmglobalsymlinkmicro
    fi
}
