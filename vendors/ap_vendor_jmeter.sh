alias apinitjmeter="ap_func_init_jmeter"
ap_func_init_jmeter() {
    addpath "${AP_SOFT_DIR}/jmeter/bin"

    if alias apinitjmetershare &>/dev/null; then
        apinitjmetershare
    fi

    if alias apinitjmetercommon &>/dev/null; then
        apinitjmetercommon
    fi

    if alias apinitjmetermain &>/dev/null; then
        apinitjmetermain
    fi
}

alias apcreatedirstructjmeter="ap_func_create_dirstruct_jmeter"
ap_func_create_dirstruct_jmeter() {
    if alias apcreatedirstructjmetershare &>/dev/null; then
        apcreatedirstructjmetershare
    fi

    if alias apcreatedirstructjmetercommon &>/dev/null; then
        apcreatedirstructjmetercommon
    fi

    if alias apcreatedirstructjmetermain &>/dev/null; then
        apcreatedirstructjmetermain
    fi
}

alias aprmdirstructjmeter="ap_func_rm_dirstruct_jmeter"
ap_func_rm_dirstruct_jmeter() {
    if alias aprmdirstructjmetershare &>/dev/null; then
        aprmdirstructjmetershare
    fi

    if alias aprmdirstructjmetercommon &>/dev/null; then
        aprmdirstructjmetercommon
    fi

    if alias aprmdirstructjmetermain &>/dev/null; then
        aprmdirstructjmetermain
    fi
}

alias apsetupjmeter="ap_func_setup_jmeter"
ap_func_setup_jmeter() {
    local ap_jmeter_setup_version='5.6.3'
    if [ -n "$1" ]; then
        ap_jmeter_setup_version="$1"
    fi

    aplogshow "Install [jmeter] v${ap_jmeter_setup_version}\n"

    # Remove old app dir if any
    rm -rf "${AP_SOFT_DIR}/jmeter"
    rm -rf "${AP_TMP_DIR}/jmeter"

    # Install jmeter
    mkdir -p "${AP_TMP_DIR}/jmeter"
    cd "${AP_TMP_DIR}/jmeter"

    curl -SL "https://dlcdn.apache.org//jmeter/binaries/apache-jmeter-${ap_jmeter_setup_version}.tgz" >jmeter.tgz
    tar -zxf jmeter.tgz
    rm -f jmeter.tar.gz
    mv jmeter* jmeter
    mv jmeter "${AP_SOFT_DIR}/"
    cd "${AP_SOFT_DIR}/jmeter"
    rm -rf "${AP_TMP_DIR}/jmeter"

    apinitjmeter
    if alias apcreatedirstructjmeter &>/dev/null; then
        apcreatedirstructjmeter
    fi
}

alias aprmjmeter="ap_func_rm_jmeter"
ap_func_rm_jmeter() {
    local ap_jmeter_remove_version='5.6.3'
    if [ -n "$1" ]; then
        ap_jmeter_remove_version="$1"
    fi

    aplogshow "Remove [jmeter] v${ap_jmeter_remove_version}\n"

    if alias aprmdirstructjmeter &>/dev/null; then
        aprmdirstructjmeter
    fi

    if alias aprmglobalsymlinkjmeter &>/dev/null; then
        aprmglobalsymlinkjmeter
    fi
}
