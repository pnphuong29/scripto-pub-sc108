alias apinittaskwarrior="ap_func_init_taskwarrior"
ap_func_init_taskwarrior() {
    apaddpath -m "${AP_SOFT_DIR}/taskwarrior/share/man"

    if alias apinittaskwarriorshare &>/dev/null; then
        apinittaskwarriorshare
    fi

    if alias apinittaskwarriorcommon &>/dev/null; then
        apinittaskwarriorcommon
    fi
}

alias apcreatedirstructtaskwarrior="ap_func_create_dirstruct_taskwarrior"
ap_func_create_dirstruct_taskwarrior() {
    aplogshow "Create symlink from [${AP_SOFT_DIR}/bin/task] to [${AP_SOFT_DIR}/taskwarrior/bin/task]\n"
    ln -sf "${AP_SOFT_DIR}/taskwarrior/bin/task" "${AP_SOFT_DIR}/bin/task"

    if alias apcreatedirstructtaskwarriorshare &>/dev/null; then
        apcreatedirstructtaskwarriorshare
    fi

    if alias apcreatedirstructtaskwarriorcommon &>/dev/null; then
        apcreatedirstructtaskwarriorcommon
    fi
}

alias aprmdirstructtaskwarrior="ap_func_rm_dirstruct_taskwarrior"
ap_func_rm_dirstruct_taskwarrior() {
    aplogshow "Remove [${AP_SOFT_DIR}/bin/task]\n"
    rm -f "${AP_SOFT_DIR}/bin/task"

    if alias aprmdirstructtaskwarriorshare &>/dev/null; then
        aprmdirstructtaskwarriorshare
    fi

    if alias aprmdirstructtaskwarriorcommon &>/dev/null; then
        aprmdirstructtaskwarriorcommon
    fi
}

alias apsetuptaskwarrior="ap_func_setup_taskwarrior"
ap_func_setup_taskwarrior() {
    # https://github.com/GothenburgBitFactory/taskwarrior
    aplogshow "Install required libraries [libgnutls-dev, cmake, make]\n"
    if [ "${AP_OS_TYPE}" == "${AP_OS_TYPE_MACOS}" ]; then
        brew install gnutls cmake make
    elif [ "${AP_OS_TYPE}" == "${AP_OS_TYPE_UBUNTU}" ]; then
        sudo apt update
        sudo apt install -y libgnutls30 libgnutls28-dev cmake make libuuid1
    fi

    aplogshow "Install [taskwarrior]\n"
    # Remove old app dir if any
    rm -rf "${AP_SOFT_DIR}/taskwarrior"
    rm -rf "${AP_TMP_DIR}/taskwarrior"

    # Install taskwarrior
    mkdir -p "${AP_TMP_DIR}/taskwarrior"
    cd "${AP_TMP_DIR}/taskwarrior"

    # Latest version (3.0) which cannot be installed properly in Ubuntu???
    # curl -SL \
    #     "$(curl --silent https://api.github.com/repos/GothenburgBitFactory/taskwarrior/releases | jq -r '.[0].assets[].browser_download_url' | grep "task-")" >taskwarrior.tar.gz

    curl -SL "https://github.com/GothenburgBitFactory/taskwarrior/releases/download/v2.6.2/task-2.6.2.tar.gz" >taskwarrior.tar.gz

    tar -zxf taskwarrior.tar.gz
    rm -f taskwarrior.tar.gz
    mv task* taskwarrior
    cd "taskwarrior"

    cmake -DCMAKE_INSTALL_PREFIX="${AP_SOFT_DIR}/taskwarrior" -DCMAKE_BUILD_TYPE=release .
    make
    make install
    # sudo make install

    cd "${AP_SOFT_DIR}/taskwarrior"

    apinittaskwarrior
    if alias apcreatedirstructtaskwarrior &>/dev/null; then
        apcreatedirstructtaskwarrior
    fi
}

alias aprmtaskwarrior="ap_func_rm_taskwarrior"
ap_func_rm_taskwarrior() {
    aplogshow "Remove [taskwarrior]\n"
    rm -rf "${AP_SOFT_DIR}/taskwarrior"

    if alias aprmdirstructtaskwarrior &>/dev/null; then
        aprmdirstructtaskwarrior
    fi

    if alias aprmglobalsymlinktaskwarrior &>/dev/null; then
        aprmglobalsymlinktaskwarrior
    fi
}
