alias apinitzig="ap_func_init_zig"
ap_func_init_zig() {
    # export AP_ZIG_SETUP_VERSION='0.14.0-dev.2649+77273103a'
    export AP_ZIG_SETUP_VERSION='0.13.0'

    if alias apinitzigshare &>/dev/null; then
        apinitzigshare
    fi

    if alias apinitzigcommon &>/dev/null; then
        apinitzigcommon
    fi

    if alias apinitzigmain &>/dev/null; then
        apinitzigmain
    fi
}

alias apcreatedirstructzig="ap_func_create_dirstruct_zig"
ap_func_create_dirstruct_zig() {
    aplogshow "Create symlink from [${AP_SOFT_DIR}/bin/zig] to [${AP_SOFT_DIR}/zig/zig]\n"
    ln -sf "${AP_SOFT_DIR}/zig/zig" "${AP_SOFT_DIR}/bin/zig"

    if alias apcreatedirstructzigshare &>/dev/null; then
        apcreatedirstructzigshare
    fi

    if alias apcreatedirstructzigcommon &>/dev/null; then
        apcreatedirstructzigcommon
    fi

    if alias apcreatedirstructzigmain &>/dev/null; then
        apcreatedirstructzigmain
    fi
}

alias aprmdirstructzig="ap_func_rm_dirstruct_zig"
ap_func_rm_dirstruct_zig() {
    if alias aprmdirstructzigshare &>/dev/null; then
        aprmdirstructzigshare
    fi

    if alias aprmdirstructzigcommon &>/dev/null; then
        aprmdirstructzigcommon
    fi

    if alias aprmdirstructzigmain &>/dev/null; then
        aprmdirstructzigmain
    fi
}

alias apsetupzig="ap_func_setup_zig"
ap_func_setup_zig() {
    local ap_zig_setup_version="${AP_ZIG_SETUP_VERSION}"
    if [ -n "$1" ]; then
        ap_zig_setup_version="$1"
    fi

    aplogshow "Install [zig] version [${ap_zig_setup_version}]\n"

    # Remove old app dir if any
    rm -rf "${AP_SOFT_DIR}/zig"
    rm -rf "${AP_TMP_DIR}/zig"

    # Install zig
    mkdir -p "${AP_TMP_DIR}/zig"
    cd "${AP_TMP_DIR}/zig"

    local ap_os="macos"
    local ap_arch="x86_64"
    if [ "${AP_OS_TYPE}" == "${AP_OS_TYPE_MACOS}" ]; then
        if [[ "$(uname -m)" == 'arm64' ]]; then
            ap_arch="aarch64"
        fi
    elif [ "${AP_OS_TYPE}" == "${AP_OS_TYPE_UBUNTU}" ]; then
        ap_os="linux"
    fi

    aplogshow "Download [zig] version [${ap_zig_setup_version}] from [https://ziglang.org/download/${ap_zig_setup_version}/zig-${ap_os}-${ap_arch}-${ap_zig_setup_version}.tar.xz]\n"
    # curl -SL "https://ziglang.org/builds/zig-${ap_os}-${ap_arch}-${ap_zig_setup_version}.tar.xz" >zig.tar.xz
    curl -SL "https://ziglang.org/download/${ap_zig_setup_version}/zig-${ap_os}-${ap_arch}-${ap_zig_setup_version}.tar.xz" >zig.tar.xz

    tar -Jxf zig.tar.xz
    rm -f zig.tar.xz
    mv zig* zig
    mv zig "${AP_SOFT_DIR}/"
    cd "${AP_SOFT_DIR}/zig"
    # rm -rf "${AP_TMP_DIR}/zig"

    apinitzig
    if alias apcreatedirstructzig &>/dev/null; then
        apcreatedirstructzig
    fi
}

alias aprmzig="ap_func_rm_zig"
ap_func_rm_zig() {
    aplogshow "Remove [zig]\n"
    rm -rf "${AP_SOFT_DIR}/zig"

    if alias aprmdirstructzig &>/dev/null; then
        aprmdirstructzig
    fi

    if alias aprmglobalsymlinkzig &>/dev/null; then
        aprmglobalsymlinkzig
    fi
}
