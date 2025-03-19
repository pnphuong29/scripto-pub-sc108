alias apinitzed="ap_func_init_zed"
ap_func_init_zed() {
    if alias apinitzedshare &>/dev/null; then
        apinitzedshare
    fi

    if alias apinitzedcommon &>/dev/null; then
        apinitzedcommon
    fi

    if alias apinitzedmain &>/dev/null; then
        apinitzedmain
    fi
}

alias apcreatedirstructzed="ap_func_create_dirstruct_zed"
ap_func_create_dirstruct_zed() {
    if alias apcreatedirstructzedshare &>/dev/null; then
        apcreatedirstructzedshare
    fi

    if alias apcreatedirstructzedcommon &>/dev/null; then
        apcreatedirstructzedcommon
    fi

    if alias apcreatedirstructzedmain &>/dev/null; then
        apcreatedirstructzedmain
    fi
}

alias aprmdirstructzed="ap_func_rm_dirstruct_zed"
ap_func_rm_dirstruct_zed() {
    if alias aprmdirstructzedshare &>/dev/null; then
        aprmdirstructzedshare
    fi

    if alias aprmdirstructzedcommon &>/dev/null; then
        aprmdirstructzedcommon
    fi

    if alias aprmdirstructzedmain &>/dev/null; then
        aprmdirstructzedmain
    fi
}

alias apsetupzed="ap_func_setup_zed"
ap_func_setup_zed() {
    aplogshow "Install [zed]\n"

    if [ "${AP_OS_TYPE}" == "${AP_OS_TYPE_MACOS}" ]; then
        # brew install --cask zed
        if [[ "$(uname -m)" == 'arm64' ]]; then
            curl -SL \
                "$(curl --silent "https://api.github.com/repos/zed-industries/zed/releases" | jq -r '.[0].assets[].browser_download_url' | grep "dmg" | grep aarch64)" >zed.dmg
        elif [[ "$(uname -m)" == 'x86_64' ]]; then
            curl -SL \
                "$(curl --silent "https://api.github.com/repos/zed-industries/zed/releases" | jq -r '.[0].assets[].browser_download_url' | grep "dmg" | grep x86_64)" >zed.dmg
        fi

        hdiutil attach -nobrowse zed.dmg
        rm -rf "/Applications/Zed.app"
        cp -R "/Volumes/Zed/Zed.app" /Applications/
        cd /Applications
        hdiutil detach "/Volumes/Zed"
    elif [ "${AP_OS_TYPE}" == "${AP_OS_TYPE_UBUNTU}" ]; then
        curl https://zed.dev/install.sh | sh
    fi

    apinitzed
    if alias apcreatedirstructzed &>/dev/null; then
        apcreatedirstructzed
    fi
}

alias aprmzed="ap_func_rm_zed"
ap_func_rm_zed() {
    aplogshow "Remove [zed]\n"

    if [ "${AP_OS_TYPE}" == "${AP_OS_TYPE_MACOS}" ]; then
        brew remove --cask zed
    # elif [ "${AP_OS_TYPE}" == "${AP_OS_TYPE_UBUNTU}" ]; then

    fi

    if alias aprmdirstructzed &>/dev/null; then
        aprmdirstructzed
    fi

    if alias aprmglobalsymlinkzed &>/dev/null; then
        aprmglobalsymlinkzed
    fi
}
