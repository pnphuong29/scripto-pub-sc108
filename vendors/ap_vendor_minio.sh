alias apinitminio="ap_func_init_minio"
ap_func_init_minio() {
    if [ "${AP_OS_TYPE}" == "${AP_OS_TYPE_MACOS}" ]; then
        local ap_mc_path
        ap_mc_path="$(brew --prefix)/bin/mc"
        complete -C "${ap_mc_path}" mc
    elif [ "${AP_OS_TYPE}" == "${AP_OS_TYPE_UBUNTU}" ]; then
        complete -C "${AP_SOFT_DIR}/bin/mc" mc
    fi

    if alias apinitminioshare &>/dev/null; then
        apinitminioshare
    fi

    if alias apinitminiocommon &>/dev/null; then
        apinitminiocommon
    fi
}

alias apcreatedirstructminio="ap_func_create_dirstruct_minio"
ap_func_create_dirstruct_minio() {
    if alias apcreatedirstructminioshare &>/dev/null; then
        apcreatedirstructminioshare
    fi

    if alias apcreatedirstructminiocommon &>/dev/null; then
        apcreatedirstructminiocommon
    fi
}

alias aprmdirstructminio="ap_func_rm_dirstruct_minio"
ap_func_rm_dirstruct_minio() {
    if alias aprmdirstructminioshare &>/dev/null; then
        aprmdirstructminioshare
    fi

    if alias aprmdirstructminiocommon &>/dev/null; then
        aprmdirstructminiocommon
    fi
}

alias apcreateglobalsymlinkminio="ap_func_create_global_symlink_minio"
ap_func_create_global_symlink_minio() {
    if [ -f "${AP_SOFT_DIR}/bin/mc" ]; then
        aplogshow "Create symlink from [/usr/local/bin/mc] to [${AP_SOFT_DIR}/bin/mc]\n"
        sudo ln -sf "${AP_SOFT_DIR}/bin/mc" "/usr/local/bin/mc"
    fi
}

alias aprmglobalsymlinkminio="ap_func_rm_global_symlink_minio"
ap_func_rm_global_symlink_minio() {
    aplogshow "Remove [/usr/local/bin/mc]\n"
    sudo rm -f "/usr/local/bin/mc"
}

alias apsetupminio="ap_func_setup_minio"
ap_func_setup_minio() {
    aplogshow "Install [minio]\n"

    # Install minio
    mkdir -p "${AP_TMP_DIR}/minio"
    cd "${AP_TMP_DIR}/minio"

    if [ "${AP_OS_TYPE}" == "${AP_OS_TYPE_MACOS}" ]; then
        brew install minio/stable/mc
    elif [ "${AP_OS_TYPE}" == "${AP_OS_TYPE_UBUNTU}" ]; then
        cd "${AP_SOFT_DIR}/bin"
        wget https://dl.min.io/client/mc/release/linux-amd64/mc
        chmod +x mc
    fi

    apinitminio
    if alias apcreatedirstructminio &>/dev/null; then
        apcreatedirstructminio
    fi
}

alias aprmminio="ap_func_rm_minio"
ap_func_rm_minio() {
    aplogshow "Remove [minio]\n"

    if [ "${AP_OS_TYPE}" == "${AP_OS_TYPE_MACOS}" ]; then
        brew remove minio/stable/mc
    elif [ "${AP_OS_TYPE}" == "${AP_OS_TYPE_UBUNTU}" ]; then
        rm -rf "${AP_SOFT_DIR}/bin/mc"
    fi

    if alias aprmdirstructminio &>/dev/null; then
        aprmdirstructminio
    fi

    if alias aprmglobalsymlinkminio &>/dev/null; then
        aprmglobalsymlinkminio
    fi
}
