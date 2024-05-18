alias apinitgitui="ap_func_init_gitui"
ap_func_init_gitui() {
    if alias apinitgituishare &>/dev/null; then
        apinitgituishare
    fi

    if alias apinitgituicommon &>/dev/null; then
        apinitgituicommon
    fi

    if alias apinitgituimain &>/dev/null; then
        apinitgituimain
    fi
}

alias apcreatedirstructgitui="ap_func_create_dirstruct_gitui"
ap_func_create_dirstruct_gitui() {
    if alias apcreatedirstructgituishare &>/dev/null; then
        apcreatedirstructgituishare
    fi

    if alias apcreatedirstructgituicommon &>/dev/null; then
        apcreatedirstructgituicommon
    fi

    if alias apcreatedirstructgituimain &>/dev/null; then
        apcreatedirstructgituimain
    fi
}

alias aprmdirstructgitui="ap_func_rm_dirstruct_gitui"
ap_func_rm_dirstruct_gitui() {
    if alias aprmdirstructgituishare &>/dev/null; then
        aprmdirstructgituishare
    fi

    if alias aprmdirstructgituicommon &>/dev/null; then
        aprmdirstructgituicommon
    fi

    if alias aprmdirstructgituimain &>/dev/null; then
        aprmdirstructgituimain
    fi
}

alias apsetupgitui="ap_func_setup_gitui"
ap_func_setup_gitui() {
    aplogshow "Install [gitui]\n"

    mkdir -p "${AP_TMP_DIR}/gitui"
    cd "${AP_TMP_DIR}/gitui"

    if [ "${AP_OS_TYPE}" == "${AP_OS_TYPE_MACOS}" ]; then
        curl -SL \
            "$(curl --silent "https://api.github.com/repos/extrawurst/gitui/releases" | jq -r '.[0].assets[].browser_download_url' | grep "mac")" >gitui.tar.gz
    elif [ "${AP_OS_TYPE}" == "${AP_OS_TYPE_UBUNTU}" ]; then
        curl -SL \
            "$(curl --silent "https://api.github.com/repos/extrawurst/gitui/releases" | jq -r '.[0].assets[].browser_download_url' | grep "linux" | grep x86_64)" >gitui.tar.gz
    fi

    tar -zxf gitui.tar.gz
    cp -f gitui "${AP_SOFT_DIR}/bin/"
    cd "${AP_SOFT_DIR}/bin"
    rm -rf "${AP_TMP_DIR}/gitui"

    apinitgitui
    if alias apcreatedirstructgitui &>/dev/null; then
        apcreatedirstructgitui
    fi
}

alias aprmgitui="ap_func_rm_gitui"
ap_func_rm_gitui() {
    aplogshow "Remove [gitui]\n"
    rm -f "${AP_SOFT_DIR}/bin/gitui"

    if alias aprmdirstructgitui &>/dev/null; then
        aprmdirstructgitui
    fi

    if alias aprmglobalsymlinkgitui &>/dev/null; then
        aprmglobalsymlinkgitui
    fi
}
