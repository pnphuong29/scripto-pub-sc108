alias apinithttptoolkit="ap_func_init_httptoolkit"
ap_func_init_httptoolkit() {
    if alias apinithttptoolkitshare &>/dev/null; then
        apinithttptoolkitshare
    fi

    if alias apinithttptoolkitcommon &>/dev/null; then
        apinithttptoolkitcommon
    fi

    if alias apinithttptoolkitmain &>/dev/null; then
        apinithttptoolkitmain
    fi
}

alias apcreatedirstructhttptoolkit="ap_func_create_dirstruct_httptoolkit"
ap_func_create_dirstruct_httptoolkit() {
    if alias apcreatedirstructhttptoolkitshare &>/dev/null; then
        apcreatedirstructhttptoolkitshare
    fi

    if alias apcreatedirstructhttptoolkitcommon &>/dev/null; then
        apcreatedirstructhttptoolkitcommon
    fi

    if alias apcreatedirstructhttptoolkitmain &>/dev/null; then
        apcreatedirstructhttptoolkitmain
    fi
}

alias aprmdirstructhttptoolkit="ap_func_rm_dirstruct_httptoolkit"
ap_func_rm_dirstruct_httptoolkit() {
    if alias aprmdirstructhttptoolkitshare &>/dev/null; then
        aprmdirstructhttptoolkitshare
    fi

    if alias aprmdirstructhttptoolkitcommon &>/dev/null; then
        aprmdirstructhttptoolkitcommon
    fi

    if alias aprmdirstructhttptoolkitmain &>/dev/null; then
        aprmdirstructhttptoolkitmain
    fi
}

alias apsetuphttptoolkit="ap_func_setup_httptoolkit"
ap_func_setup_httptoolkit() {
    local ap_httptoolkit_setup_version
    ap_httptoolkit_setup_version="$(curl --silent "https://api.github.com/repos/httptoolkit/httptoolkit-desktop/releases" | jq -r '.[0].assets[].browser_download_url' | grep "dmg" | grep -v blockmap)"
    ap_httptoolkit_setup_version="${ap_httptoolkit_setup_version##*/}" # Get file name
    ap_httptoolkit_setup_version="${ap_httptoolkit_setup_version//HttpToolkit-/}"
    ap_httptoolkit_setup_version="${ap_httptoolkit_setup_version//.dmg/}"
    aplogshow "Install [Http Toolkit v${ap_httptoolkit_setup_version}]\n"

    # Install httptoolkit
    mkdir -p "${AP_TMP_DIR}/httptoolkit"
    cd "${AP_TMP_DIR}/httptoolkit"

    if [ "${AP_OS_TYPE}" == "${AP_OS_TYPE_MACOS}" ]; then
        curl -SL \
            "$(curl --silent "https://api.github.com/repos/httptoolkit/httptoolkit-desktop/releases" | jq -r '.[0].assets[].browser_download_url' | grep "dmg" | grep -v blockmap)" >httptoolkit.dmg

        hdiutil attach -nobrowse httptoolkit.dmg
        cd "/Volumes/Http Toolkit ${ap_httptoolkit_setup_version}"
        cp -R "Http Toolkit.app" /Applications/
        cd /Applications
        hdiutil detach "/Volumes/Http Toolkit ${ap_httptoolkit_setup_version}"
    elif [ "${AP_OS_TYPE}" == "${AP_OS_TYPE_UBUNTU}" ]; then
        curl -SL \
            "$(curl --silent "https://api.github.com/repos/httptoolkit/httptoolkit-desktop/releases" | jq -r '.[0].assets[].browser_download_url' | grep "deb")" >httptoolkit.deb
        sudo dpkg -i httptoolkit.deb
    fi

    apinithttptoolkit
    if alias apcreatedirstructhttptoolkit &>/dev/null; then
        apcreatedirstructhttptoolkit
    fi
}

alias aprmhttptoolkit="ap_func_rm_httptoolkit"
ap_func_rm_httptoolkit() {
    aplogshow "Remove [httptoolkit]\n"

    if [ "${AP_OS_TYPE}" == "${AP_OS_TYPE_MACOS}" ]; then
        rm -rf "/Applications/Http Toolkit"
    elif [ "${AP_OS_TYPE}" == "${AP_OS_TYPE_UBUNTU}" ]; then
        sudo dpkg --purge httptoolkit
    fi

    if alias aprmdirstructhttptoolkit &>/dev/null; then
        aprmdirstructhttptoolkit
    fi

    if alias aprmglobalsymlinkhttptoolkit &>/dev/null; then
        aprmglobalsymlinkhttptoolkit
    fi
}
