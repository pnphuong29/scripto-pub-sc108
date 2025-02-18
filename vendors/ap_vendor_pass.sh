# https://git.zx2c4.com/password-store/about/
alias apinitpass="ap_func_init_pass"
ap_func_init_pass() {
    if alias apinitpassshare &>/dev/null; then
        apinitpassshare
    fi

    if alias apinitpasscommon &>/dev/null; then
        apinitpasscommon
    fi
}

alias apcreatedirstructpass="ap_func_create_dirstruct_pass"
ap_func_create_dirstruct_pass() {
    if alias apcreatedirstructpassshare &>/dev/null; then
        apcreatedirstructpassshare
    fi

    if alias apcreatedirstructpasscommon &>/dev/null; then
        apcreatedirstructpasscommon
    fi
}

alias aprmdirstructpass="ap_func_rm_dirstruct_pass"
ap_func_rm_dirstruct_pass() {
    if alias aprmdirstructpassshare &>/dev/null; then
        aprmdirstructpassshare
    fi

    if alias aprmdirstructpasscommon &>/dev/null; then
        aprmdirstructpasscommon
    fi
}

alias apsetuppass="ap_func_setup_pass"
ap_func_setup_pass() {
    aplogshow "Install [pass]\n"

    # Option 1: Install pass from package manager
    if [[ "${AP_OS_TYPE}" == "${AP_OS_TYPE_MACOS}" ]]; then
        brew install gpg2 pass
    elif [[ "${AP_OS_TYPE}" == "${AP_OS_TYPE_UBUNTU}" ]]; then
        sudo apt install -y gpg pass
    fi

    # Option 2: Install pass from source
    # # Remove old app dir if any
    # rm -rf "${AP_SOFT_DIR}/pass"
    # rm -rf "${AP_TMP_DIR}/pass"

    # # Install pass
    # mkdir -p "${AP_TMP_DIR}/pass"
    # cd "${AP_TMP_DIR}/pass"

    # curl -SOL "https://git.zx2c4.com/password-store/snapshot/password-store-master.tar.xz"
    # tar -Jxf password-store-master.tar.xz
    # cd password-store-master
    # PREFIX="${AP_SOFT_DIR}/pass" WITH_ALLCOMP=yes make install

    # cd "${AP_SOFT_DIR}/pass"
    # rm -rf "${AP_TMP_DIR}/pass"

    apinitpass
    if alias apcreatedirstructpass &>/dev/null; then
        apcreatedirstructpass
    fi
}

alias aprmpass="ap_func_rm_pass"
ap_func_rm_pass() {
    aplogshow "Remove [pass]\n"
    # rm -rf "${AP_SOFT_DIR}/pass"

    if [ "${AP_OS_TYPE}" == "${AP_OS_TYPE_MACOS}" ]; then
        brew remove pass
    elif [ "${AP_OS_TYPE}" == "${AP_OS_TYPE_UBUNTU}" ]; then
        sudo apt remove --purge -y pass
        sudo apt autoremove --purge -y
    fi

    if alias aprmdirstructpass &>/dev/null; then
        aprmdirstructpass
    fi

    if alias aprmglobalsymlinkpass &>/dev/null; then
        aprmglobalsymlinkpass
    fi
}
