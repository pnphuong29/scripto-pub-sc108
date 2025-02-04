alias apinitdbeaver="ap_func_init_dbeaver"
ap_func_init_dbeaver() {
    if alias apinitdbeavershare &>/dev/null; then
        apinitdbeavershare
    fi

    if alias apinitdbeavercommon &>/dev/null; then
        apinitdbeavercommon
    fi
}

alias apcreatedirstructdbeaver="ap_func_create_dirstruct_dbeaver"
ap_func_create_dirstruct_dbeaver() {
    if alias apcreatedirstructdbeavershare &>/dev/null; then
        apcreatedirstructdbeavershare
    fi

    if alias apcreatedirstructdbeavercommon &>/dev/null; then
        apcreatedirstructdbeavercommon
    fi
}

alias aprmdirstructdbeaver="ap_func_rm_dirstruct_dbeaver"
ap_func_rm_dirstruct_dbeaver() {
    if alias aprmdirstructdbeavershare &>/dev/null; then
        aprmdirstructdbeavershare
    fi

    if alias aprmdirstructdbeavercommon &>/dev/null; then
        aprmdirstructdbeavercommon
    fi
}

alias apsetupdbeaver="ap_func_setup_dbeaver"
ap_func_setup_dbeaver() {
    aplogshow "Install [Dbeaver]\n"

    # Remove old app dir if any
    rm -rf "${AP_TMP_DIR}/dbeaver"

    # Install dbeaver
    mkdir -p "${AP_TMP_DIR}/dbeaver"
    cd "${AP_TMP_DIR}/dbeaver"

    if [ "${AP_OS_TYPE}" == "${AP_OS_TYPE_MACOS}" ]; then
        curl -SL \
            "$(curl --silent https://api.github.com/repos/dbeaver/dbeaver/releases | jq -r '.[0].assets[].browser_download_url' | grep "macos-x86_64.dmg$")" >dbeaver.dmg
        hdiutil attach -nobrowse dbeaver.dmg
        cd "/Volumes/DBeaver Community"
        cp -R DBeaver.app /Applications/
        hdiutil detach "/Volumes/DBeaver Community"
    elif [ "${AP_OS_TYPE}" == "${AP_OS_TYPE_UBUNTU}" ]; then
        curl -SL \
            "$(curl --silent https://api.github.com/repos/dbeaver/dbeaver/releases | jq -r '.[0].assets[].browser_download_url' | grep "amd64.deb$")" >dbeaver.deb
        sudo dpkg -i dbeaver.deb
    fi

    cd ~
    apinitdbeaver

    if alias apcreatedirstructdbeaver &>/dev/null; then
        apcreatedirstructdbeaver
    fi
}

alias aprmdbeaver="ap_func_rm_dbeaver"
ap_func_rm_dbeaver() {
    aplogshow "Remove [dbeaver]\n"

    if [ "${AP_OS_TYPE}" == "${AP_OS_TYPE_MACOS}" ]; then
        rm -rf "/Applications/Dbeaver.app"
    elif [ "${AP_OS_TYPE}" == "${AP_OS_TYPE_UBUNTU}" ]; then
        sudo dpkg --purge dbeaver
    fi

    if alias aprmdirstructdbeaver &>/dev/null; then
        aprmdirstructdbeaver
    fi

    if alias aprmglobalsymlinkdbeaver &>/dev/null; then
        aprmglobalsymlinkdbeaver
    fi
}
