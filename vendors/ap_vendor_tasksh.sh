alias @inittasksh="ap_func_init_tasksh"
ap_func_init_tasksh() {
    if alias @inittaskshshare &>/dev/null; then
        @inittaskshshare
    fi

    if alias @inittaskshcommon &>/dev/null; then
        @inittaskshcommon
    fi
}

alias @createdirstructtasksh="ap_func_create_dirstruct_tasksh"
ap_func_create_dirstruct_tasksh() {
    @logshow "Create symlink from [${AP_SOFT_DIR}/bin/tasksh] to [${AP_SOFT_DIR}/tasksh/bin/tasksh]\n"
    ln -sf "${AP_SOFT_DIR}/tasksh/bin/tasksh" "${AP_SOFT_DIR}/bin/tasksh"

    if alias @createdirstructtaskshshare &>/dev/null; then
        @createdirstructtaskshshare
    fi

    if alias @createdirstructtaskshcommon &>/dev/null; then
        @createdirstructtaskshcommon
    fi
}

alias @rmdirstructtasksh="ap_func_rm_dirstruct_tasksh"
ap_func_rm_dirstruct_tasksh() {
    @logshow "Remove [${AP_SOFT_DIR}/bin/tasksh]\n"
    rm -f "${AP_SOFT_DIR}/bin/tasksh"

    if alias @rmdirstructtaskshshare &>/dev/null; then
        @rmdirstructtaskshshare
    fi

    if alias @rmdirstructtaskshcommon &>/dev/null; then
        @rmdirstructtaskshcommon
    fi
}

alias @setuptasksh="ap_func_setup_tasksh"
ap_func_setup_tasksh() {
    # https://github.com/GothenburgBitFactory/taskshell
    @logshow "Install [tasksh]\n"

    mkdir -p "${AP_TMP_DIR}/tasksh"
    cd "${AP_TMP_DIR}/tasksh"

    curl -SL \
        "$(curl --silent https://api.github.com/repos/GothenburgBitFactory/taskshell/releases | jq -r '.[0].assets[].browser_download_url' | grep "tasksh-")" >tasksh.tar.gz

    tar -zxf tasksh.tar.gz
    rm -f tasksh.tar.gz
    mv tasksh* tasksh
    cd "tasksh"

    cmake -DCMAKE_INSTALL_PREFIX="${AP_SOFT_DIR}/tasksh" -DCMAKE_BUILD_TYPE=release .
    make
    make install
    # sudo make install

    cd "${AP_SOFT_DIR}/tasksh"

    @inittasksh
    if alias @createdirstructtasksh &>/dev/null; then
        @createdirstructtasksh
    fi
}

alias @rmtasksh="ap_func_rm_tasksh"
ap_func_rm_tasksh() {
    @logshow "Remove [tasksh]\n"
    rm -rf "${AP_SOFT_DIR}/tasksh"

    if alias @rmdirstructtasksh &>/dev/null; then
        @rmdirstructtasksh
    fi

    if alias @rmglobalsymlinktasksh &>/dev/null; then
        @rmglobalsymlinktasksh
    fi
}
