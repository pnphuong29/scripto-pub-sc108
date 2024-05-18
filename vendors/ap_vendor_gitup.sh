alias apinitgitup="ap_func_init_gitup"
ap_func_init_gitup() {
    if alias apinitgitupshare &>/dev/null; then
        apinitgitupshare
    fi

    if alias apinitgitupcommon &>/dev/null; then
        apinitgitupcommon
    fi

    if alias apinitgitupmain &>/dev/null; then
        apinitgitupmain
    fi
}

alias apcreatedirstructgitup="ap_func_create_dirstruct_gitup"
ap_func_create_dirstruct_gitup() {
    if alias apcreatedirstructgitupshare &>/dev/null; then
        apcreatedirstructgitupshare
    fi

    if alias apcreatedirstructgitupcommon &>/dev/null; then
        apcreatedirstructgitupcommon
    fi

    if alias apcreatedirstructgitupmain &>/dev/null; then
        apcreatedirstructgitupmain
    fi
}

alias aprmdirstructgitup="ap_func_rm_dirstruct_gitup"
ap_func_rm_dirstruct_gitup() {
    if alias aprmdirstructgitupshare &>/dev/null; then
        aprmdirstructgitupshare
    fi

    if alias aprmdirstructgitupcommon &>/dev/null; then
        aprmdirstructgitupcommon
    fi

    if alias aprmdirstructgitupmain &>/dev/null; then
        aprmdirstructgitupmain
    fi
}

alias apcreateglobalsymlinkgitup="ap_func_create_global_symlink_gitup"
ap_func_create_global_symlink_gitup() {
    if [ -f "${AP_SOFT_DIR}/bin/gitup" ]; then
        aplogshow "Create symlink from [/usr/local/bin/gitup] to [${AP_SOFT_DIR}/bin/gitup]\n"
        sudo ln -sf "${AP_SOFT_DIR}/bin/gitup" "/usr/local/bin/gitup"
    fi
}

alias aprmglobalsymlinkgitup="ap_func_rm_global_symlink_gitup"
ap_func_rm_global_symlink_gitup() {
    if [ -f "/usr/local/bin/gitup" ]; then
        aplogshow "Remove [/usr/local/bin/gitup]\n"
        sudo rm -f "/usr/local/bin/gitup"
    fi
}

alias apsetupgitup="ap_func_setup_gitup"
ap_func_setup_gitup() {
    aplogshow "Install [gitup]\n"

    # Remove old app dir if any
    rm -rf "/Applications/GitUp.app"
    rm -rf "${AP_TMP_DIR}/gitup"

    # Install gitup
    mkdir -p "${AP_TMP_DIR}/gitup"
    cd "${AP_TMP_DIR}/gitup"

    if [ "${AP_OS_TYPE}" == "${AP_OS_TYPE_MACOS}" ]; then
        curl -SLO "https://s3-us-west-2.amazonaws.com/gitup-builds/stable/GitUp.zip"
        unzip GitUp.zip
        cp -R GitUp.app /Applications/
        cd /Applications
        rm -rf "${AP_TMP_DIR}/gitup"
    fi

    apinitgitup
    if alias apcreatedirstructgitup &>/dev/null; then
        apcreatedirstructgitup
    fi
}

alias aprmgitup="ap_func_rm_gitup"
ap_func_rm_gitup() {
    aplogshow "Remove [gitup]\n"

    if [ "${AP_OS_TYPE}" == "${AP_OS_TYPE_MACOS}" ]; then
        rm -rf /Applications/GitUp.app
    fi

    if alias aprmdirstructgitup &>/dev/null; then
        aprmdirstructgitup
    fi

    if alias aprmglobalsymlinkgitup &>/dev/null; then
        aprmglobalsymlinkgitup
    fi
}
