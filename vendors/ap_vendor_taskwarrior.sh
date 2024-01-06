alias @inittaskwarrior="ap_func_init_taskwarrior"
ap_func_init_taskwarrior() {
    @addpath -m "${AP_SOFT_DIR}/taskwarrior/share/man"

    if alias @inittaskwarriorshare &>/dev/null; then
        @inittaskwarriorshare
    fi

    if alias @inittaskwarriorcommon &>/dev/null; then
        @inittaskwarriorcommon
    fi
}

alias @createdirstructtaskwarrior="ap_func_create_dirstruct_taskwarrior"
ap_func_create_dirstruct_taskwarrior() {
    @logshow "Create symlink from [${AP_SOFT_DIR}/bin/task] to [${AP_SOFT_DIR}/taskwarrior/bin/task]\n"
    ln -sf "${AP_SOFT_DIR}/taskwarrior/bin/task" "${AP_SOFT_DIR}/bin/task"

    if alias @createdirstructtaskwarriorshare &>/dev/null; then
        @createdirstructtaskwarriorshare
    fi

    if alias @createdirstructtaskwarriorcommon &>/dev/null; then
        @createdirstructtaskwarriorcommon
    fi
}

alias @rmdirstructtaskwarrior="ap_func_rm_dirstruct_taskwarrior"
ap_func_rm_dirstruct_taskwarrior() {
    @logshow "Remove [${AP_SOFT_DIR}/bin/task]\n"
    rm -f "${AP_SOFT_DIR}/bin/task"

    if alias @rmdirstructtaskwarriorshare &>/dev/null; then
        @rmdirstructtaskwarriorshare
    fi

    if alias @rmdirstructtaskwarriorcommon &>/dev/null; then
        @rmdirstructtaskwarriorcommon
    fi
}

alias @setuptaskwarrior="ap_func_setup_taskwarrior"
ap_func_setup_taskwarrior() {
    # https://github.com/GothenburgBitFactory/taskwarrior
    @logshow "Install required libraries [libgnutls-dev, cmake, make, libuuid]\n"
    if [ "${AP_OS_TYPE}" == "${AP_OS_TYPE_MACOS}" ]; then
        brew install gnutls cmake make libuuid
    elif [ "${AP_OS_TYPE}" == "${AP_OS_TYPE_UBUNTU}" ]; then
        sudo apt update
        sudo apt install -y libgnutls-dev cmake make libuuid1
    fi

    @logshow "Install [taskwarrior]\n"
    # Remove old app dir if any
    rm -rf "${AP_SOFT_DIR}/taskwarrior"
    rm -rf "${AP_TMP_DIR}/taskwarrior"

    # Install taskwarrior
    mkdir -p "${AP_TMP_DIR}/taskwarrior"
    cd "${AP_TMP_DIR}/taskwarrior"

    curl -SL \
        "$(curl --silent https://api.github.com/repos/GothenburgBitFactory/taskwarrior/releases | jq -r '.[0].assets[].browser_download_url' | grep "task-")" >taskwarrior.tar.gz

    tar -zxf taskwarrior.tar.gz
    rm -f taskwarrior.tar.gz
    mv task* taskwarrior
    cd "taskwarrior"

    cmake -DCMAKE_INSTALL_PREFIX="${AP_SOFT_DIR}/taskwarrior" -DCMAKE_BUILD_TYPE=release .
    make
    make install
    # sudo make install
    cd "${AP_SOFT_DIR}/taskwarrior"

    @inittaskwarrior
    if alias @createdirstructtaskwarrior &>/dev/null; then
        @createdirstructtaskwarrior
    fi
}

alias @rmtaskwarrior="ap_func_rm_taskwarrior"
ap_func_rm_taskwarrior() {
    @logshow "Remove [taskwarrior]\n"
    rm -rf "${AP_SOFT_DIR}/taskwarrior"

    if alias @rmdirstructtaskwarrior &>/dev/null; then
        @rmdirstructtaskwarrior
    fi

    if alias @rmglobalsymlinktaskwarrior &>/dev/null; then
        @rmglobalsymlinktaskwarrior
    fi
}
