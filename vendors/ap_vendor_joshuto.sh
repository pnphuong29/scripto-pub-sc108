alias apinitjoshuto="ap_func_init_joshuto"
ap_func_init_joshuto() {
    if alias apinitjoshutoshare &>/dev/null; then
        apinitjoshutoshare
    fi

    if alias apinitjoshutocommon &>/dev/null; then
        apinitjoshutocommon
    fi
}

alias apcreatedirstructjoshuto="ap_func_create_dirstruct_joshuto"
ap_func_create_dirstruct_joshuto() {
    if alias apcreatedirstructjoshutoshare &>/dev/null; then
        apcreatedirstructjoshutoshare
    fi

    if alias apcreatedirstructjoshutocommon &>/dev/null; then
        apcreatedirstructjoshutocommon
    fi
}

alias aprmdirstructjoshuto="ap_func_rm_dirstruct_joshuto"
ap_func_rm_dirstruct_joshuto() {
    if alias aprmdirstructjoshutoshare &>/dev/null; then
        aprmdirstructjoshutoshare
    fi

    if alias aprmdirstructjoshutocommon &>/dev/null; then
        aprmdirstructjoshutocommon
    fi
}

alias apsetupjoshuto="ap_func_setup_joshuto"
ap_func_setup_joshuto() {
    # https://github.com/kamiyaa/joshuto
    aplogshow "Install [joshuto]\n"

    # Remove old app dir if any
    rm -rf "${AP_SOFT_DIR}/joshuto"
    rm -rf "${AP_TMP_DIR}/joshuto"

    # Install joshuto
    mkdir -p "${AP_TMP_DIR}/joshuto"
    cd "${AP_TMP_DIR}/joshuto"

    if [ "${AP_OS_TYPE}" == "${AP_OS_TYPE_MACOS}" ]; then
        curl -SL \
            "$(curl --silent https://api.github.com/repos/kamiyaa/joshuto/releases | jq -r '.[0].assets[].browser_download_url' | grep "darwin" | grep x86_64 | grep -v sha256)" >joshuto.tar.gz
    elif [ "${AP_OS_TYPE}" == "${AP_OS_TYPE_UBUNTU}" ]; then
        curl -SL \
            "$(curl --silent https://api.github.com/repos/kamiyaa/joshuto/releases | jq -r '.[0].assets[].browser_download_url' | grep "linux" | grep x86_64 | grep -v sha256 | grep "musl")" >joshuto.tar.gz
    fi

    tar -zxf joshuto.tar.gz
    rm -f joshuto.tar.gz
    mv joshuto* joshuto
    mv joshuto/joshuto "${AP_SOFT_DIR}/bin/"
    cd "${AP_SOFT_DIR}"
    rm -rf "${AP_TMP_DIR}/joshuto"

    apinitjoshuto
    if alias apcreatedirstructjoshuto &>/dev/null; then
        apcreatedirstructjoshuto
    fi
}

alias aprmjoshuto="ap_func_rm_joshuto"
ap_func_rm_joshuto() {
    aplogshow "Remove [joshuto]\n"

    rm -f "${AP_SOFT_DIR}/bin/joshuto"

    if alias aprmdirstructjoshuto &>/dev/null; then
        aprmdirstructjoshuto
    fi

    if alias aprmglobalsymlinkjoshuto &>/dev/null; then
        aprmglobalsymlinkjoshuto
    fi
}
