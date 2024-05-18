alias apinitgitbrunch="ap_func_init_gitbrunch"
ap_func_init_gitbrunch() {
    if alias apinitgitbrunchshare &>/dev/null; then
        apinitgitbrunchshare
    fi

    if alias apinitgitbrunchcommon &>/dev/null; then
        apinitgitbrunchcommon
    fi

    if alias apinitgitbrunchmain &>/dev/null; then
        apinitgitbrunchmain
    fi
}

alias apcreatedirstructgitbrunch="ap_func_create_dirstruct_gitbrunch"
ap_func_create_dirstruct_gitbrunch() {
    if alias apcreatedirstructgitbrunchshare &>/dev/null; then
        apcreatedirstructgitbrunchshare
    fi

    if alias apcreatedirstructgitbrunchcommon &>/dev/null; then
        apcreatedirstructgitbrunchcommon
    fi

    if alias apcreatedirstructgitbrunchmain &>/dev/null; then
        apcreatedirstructgitbrunchmain
    fi
}

alias aprmdirstructgitbrunch="ap_func_rm_dirstruct_gitbrunch"
ap_func_rm_dirstruct_gitbrunch() {
    if alias aprmdirstructgitbrunchshare &>/dev/null; then
        aprmdirstructgitbrunchshare
    fi

    if alias aprmdirstructgitbrunchcommon &>/dev/null; then
        aprmdirstructgitbrunchcommon
    fi

    if alias aprmdirstructgitbrunchmain &>/dev/null; then
        aprmdirstructgitbrunchmain
    fi
}

alias apsetupgitbrunch="ap_func_setup_gitbrunch"
ap_func_setup_gitbrunch() {
    aplogshow "Install [gitbrunch]\n"

    # Remove old app dir if any
    rm -f "${AP_SOFT_DIR}/bin/git-brunch"
    rm -rf "${AP_TMP_DIR}/gitbrunch"

    # Install gitbrunch
    mkdir -p "${AP_TMP_DIR}/gitbrunch"
    cd "${AP_TMP_DIR}/gitbrunch"

    local ap_os="macOS"
    if [ "${AP_OS_TYPE}" == "${AP_OS_TYPE_UBUNTU}" ]; then
        ap_os="Linux"
    fi

    curl -SL \
        "$(curl --silent https://api.github.com/repos/andys8/git-brunch/releases | jq -r '.[0].assets[].browser_download_url' | grep "${ap_os}")" >git-brunch

    chmod +x git-brunch
    cp -f git-brunch "${AP_SOFT_DIR}/bin/"
    cd "${AP_SOFT_DIR}/bin"
    rm -rf "${AP_TMP_DIR}/gitbrunch"

    apinitgitbrunch
    if alias apcreatedirstructgitbrunch &>/dev/null; then
        apcreatedirstructgitbrunch
    fi
}

alias aprmgitbrunch="ap_func_rm_gitbrunch"
ap_func_rm_gitbrunch() {
    aplogshow "Remove [gitbrunch]\n"
    rm -rf "${AP_SOFT_DIR}/bin/git-brunch"

    if alias aprmdirstructgitbrunch &>/dev/null; then
        aprmdirstructgitbrunch
    fi

    if alias aprmglobalsymlinkgitbrunch &>/dev/null; then
        aprmglobalsymlinkgitbrunch
    fi
}
