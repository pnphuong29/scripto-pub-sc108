alias apinittasksh="ap_func_init_tasksh"
ap_func_init_tasksh() {
    if alias apinittaskshshare &>/dev/null; then
        apinittaskshshare
    fi

    if alias apinittaskshcommon &>/dev/null; then
        apinittaskshcommon
    fi
}

alias apcreatedirstructtasksh="ap_func_create_dirstruct_tasksh"
ap_func_create_dirstruct_tasksh() {
    aplogshow "Create symlink from [${AP_SOFT_DIR}/bin/tasksh] to [${AP_SOFT_DIR}/tasksh/bin/tasksh]\n"
    ln -sf "${AP_SOFT_DIR}/tasksh/bin/tasksh" "${AP_SOFT_DIR}/bin/tasksh"

    if alias apcreatedirstructtaskshshare &>/dev/null; then
        apcreatedirstructtaskshshare
    fi

    if alias apcreatedirstructtaskshcommon &>/dev/null; then
        apcreatedirstructtaskshcommon
    fi
}

alias aprmdirstructtasksh="ap_func_rm_dirstruct_tasksh"
ap_func_rm_dirstruct_tasksh() {
    aplogshow "Remove [${AP_SOFT_DIR}/bin/tasksh]\n"
    rm -f "${AP_SOFT_DIR}/bin/tasksh"

    if alias aprmdirstructtaskshshare &>/dev/null; then
        aprmdirstructtaskshshare
    fi

    if alias aprmdirstructtaskshcommon &>/dev/null; then
        aprmdirstructtaskshcommon
    fi
}

alias apsetuptasksh="ap_func_setup_tasksh"
ap_func_setup_tasksh() {
    # https://github.com/GothenburgBitFactory/taskshell
    aplogshow "Install [tasksh]\n"

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

    apinittasksh
    if alias apcreatedirstructtasksh &>/dev/null; then
        apcreatedirstructtasksh
    fi
}

alias aprmtasksh="ap_func_rm_tasksh"
ap_func_rm_tasksh() {
    aplogshow "Remove [tasksh]\n"
    rm -rf "${AP_SOFT_DIR}/tasksh"

    if alias aprmdirstructtasksh &>/dev/null; then
        aprmdirstructtasksh
    fi

    if alias aprmglobalsymlinktasksh &>/dev/null; then
        aprmglobalsymlinktasksh
    fi
}
