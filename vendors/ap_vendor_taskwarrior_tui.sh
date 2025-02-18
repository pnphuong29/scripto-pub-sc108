alias apinittaskwarriortui="ap_func_init_taskwarriortui"
ap_func_init_taskwarriortui() {
    if alias apinittaskwarriortuishare &>/dev/null; then
        apinittaskwarriortuishare
    fi

    if alias apinittaskwarriortuicommon &>/dev/null; then
        apinittaskwarriortuicommon
    fi
}

alias apcreatedirstructtaskwarriortui="ap_func_create_dirstruct_taskwarriortui"
ap_func_create_dirstruct_taskwarriortui() {
    if alias apcreatedirstructtaskwarriortuishare &>/dev/null; then
        apcreatedirstructtaskwarriortuishare
    fi

    if alias apcreatedirstructtaskwarriortuicommon &>/dev/null; then
        apcreatedirstructtaskwarriortuicommon
    fi
}

alias aprmdirstructtaskwarriortui="ap_func_rm_dirstruct_taskwarriortui"
ap_func_rm_dirstruct_taskwarriortui() {
    if alias aprmdirstructtaskwarriortuishare &>/dev/null; then
        aprmdirstructtaskwarriortuishare
    fi

    if alias aprmdirstructtaskwarriortuicommon &>/dev/null; then
        aprmdirstructtaskwarriortuicommon
    fi
}

alias apsetuptaskwarriortui="ap_func_setup_taskwarriortui"
ap_func_setup_taskwarriortui() {
    aplogshow "Install [taskwarrior-tui]\n"

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

    apinittaskwarriortui
    if alias apcreatedirstructtaskwarriortui &>/dev/null; then
        apcreatedirstructtaskwarriortui
    fi
}

alias aprmtaskwarriortui="ap_func_rm_taskwarriortui"
ap_func_rm_taskwarriortui() {
    rm -f "${AP_SOFT_DIR}/bin/taskwarrior-tui"

    if alias aprmdirstructtaskwarriortui &>/dev/null; then
        aprmdirstructtaskwarriortui
    fi

    if alias aprmglobalsymlinktaskwarriortui &>/dev/null; then
        aprmglobalsymlinktaskwarriortui
    fi
}
