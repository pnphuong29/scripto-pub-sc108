alias @initpass="ap_func_init_pass"
ap_func_init_pass() {
    if [ -f "${AP_SOFT_DIR}/pass/share/bash-completion/completions/bash" ]; then
        source "${AP_SOFT_DIR}/pass/share/bash-completion/completions/bash"
    fi

    if alias @initpassshare &>/dev/null; then
        @initpassshare
    fi

    if alias @initpasscommon &>/dev/null; then
        @initpasscommon
    fi
}

alias @createdirstructpass="ap_func_create_dirstruct_pass"
ap_func_create_dirstruct_pass() {
    if alias @createdirstructpassshare &>/dev/null; then
        @createdirstructpassshare
    fi

    if alias @createdirstructpasscommon &>/dev/null; then
        @createdirstructpasscommon
    fi
}

alias @rmdirstructpass="ap_func_rm_dirstruct_pass"
ap_func_rm_dirstruct_pass() {
    if alias @rmdirstructpassshare &>/dev/null; then
        @rmdirstructpassshare
    fi

    if alias @rmdirstructpasscommon &>/dev/null; then
        @rmdirstructpasscommon
    fi
}

alias @setuppass="ap_func_setup_pass"
ap_func_setup_pass() {
    @logshow "Install [pass]\n"

    # Remove old app dir if any
    rm -rf "${AP_SOFT_DIR}/pass"
    rm -rf "${AP_TMP_DIR}/pass"

    # Install pass
    mkdir -p "${AP_TMP_DIR}/pass"
    cd "${AP_TMP_DIR}/pass"

    if [ "${AP_OS_TYPE}" == "${AP_OS_TYPE_UBUNTU}" ]; then
        curl -SOL "https://git.zx2c4.com/password-store/snapshot/password-store-master.tar.xz"
    fi

    tar -Jxf password-store-master.tar.xz
    cd password-store-master
    PREFIX="${AP_SOFT_DIR}/pass" WITH_ALLCOMP=yes make install

    cd "${AP_SOFT_DIR}/pass"
    rm -rf "${AP_TMP_DIR}/pass"

    @initpass
    if alias @createdirstructpass &>/dev/null; then
        @createdirstructpass
    fi
}

alias @rmpass="ap_func_rm_pass"
ap_func_rm_pass() {
    @logshow "Remove [pass]\n"
    rm -rf "${AP_SOFT_DIR}/pass"

    if alias @rmdirstructpass &>/dev/null; then
        @rmdirstructpass
    fi

    if alias @rmglobalsymlinkpass &>/dev/null; then
        @rmglobalsymlinkpass
    fi
}
