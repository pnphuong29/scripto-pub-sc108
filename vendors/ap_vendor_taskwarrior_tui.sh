alias @inittaskwarriortui="ap_func_init_taskwarriortui"
ap_func_init_taskwarriortui() {
    if alias @inittaskwarriortuishare &>/dev/null; then
        @inittaskwarriortuishare
    fi

    if alias @inittaskwarriortuicommon &>/dev/null; then
        @inittaskwarriortuicommon
    fi
}

alias @createdirstructtaskwarriortui="ap_func_create_dirstruct_taskwarriortui"
ap_func_create_dirstruct_taskwarriortui() {
    if alias @createdirstructtaskwarriortuishare &>/dev/null; then
        @createdirstructtaskwarriortuishare
    fi

    if alias @createdirstructtaskwarriortuicommon &>/dev/null; then
        @createdirstructtaskwarriortuicommon
    fi
}

alias @rmdirstructtaskwarriortui="ap_func_rm_dirstruct_taskwarriortui"
ap_func_rm_dirstruct_taskwarriortui() {
    if alias @rmdirstructtaskwarriortuishare &>/dev/null; then
        @rmdirstructtaskwarriortuishare
    fi

    if alias @rmdirstructtaskwarriortuicommon &>/dev/null; then
        @rmdirstructtaskwarriortuicommon
    fi
}

alias @setuptaskwarriortui="ap_func_setup_taskwarriortui"
ap_func_setup_taskwarriortui() {
    @logshow "Install [taskwarrior-tui]\n"

    cd "${AP_TMP_DIR}"

    if [ "${AP_OS_TYPE}" == "${AP_OS_TYPE_MACOS}" ]; then
        curl -SL \
            "$(curl --silent https://api.github.com/repos/kdheepak/taskwarrior-tui/releases | jq -r '.[0].assets[].browser_download_url' | grep "darwin" | grep x86_64 | grep -v sha256)" >taskwarrior-tui.tar.gz
    elif [ "${AP_OS_TYPE}" == "${AP_OS_TYPE_UBUNTU}" ]; then
        curl -SL \
            "$(curl --silent https://api.github.com/repos/kdheepak/taskwarrior-tui/releases | jq -r '.[0].assets[].browser_download_url' | grep "linux" | grep "musl" | grep -v sha256)" >taskwarrior-tui.tar.gz
    fi

    tar -zxf taskwarrior-tui.tar.gz
    rm -f taskwarrior-tui.tar.gz
    mv taskwarrior-tui "${AP_SOFT_DIR}/bin/"

    @inittaskwarriortui
    if alias @createdirstructtaskwarriortui &>/dev/null; then
        @createdirstructtaskwarriortui
    fi
}

alias @rmtaskwarriortui="ap_func_rm_taskwarriortui"
ap_func_rm_taskwarriortui() {
    rm -f "${AP_SOFT_DIR}/bin/taskwarrior-tui"

    if alias @rmdirstructtaskwarriortui &>/dev/null; then
        @rmdirstructtaskwarriortui
    fi

    if alias @rmglobalsymlinktaskwarriortui &>/dev/null; then
        @rmglobalsymlinktaskwarriortui
    fi
}
