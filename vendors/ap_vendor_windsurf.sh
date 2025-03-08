alias apinitwindsurf="ap_func_init_windsurf"
ap_func_init_windsurf() {
    export AP_WINDSURF_SETUP_VERSION='1.3.4'

    if alias apinitwindsurfshare &>/dev/null; then
        apinitwindsurfshare
    fi

    if alias apinitwindsurfcommon &>/dev/null; then
        apinitwindsurfcommon
    fi

    if alias apinitwindsurfmain &>/dev/null; then
        apinitwindsurfmain
    fi
}

alias apcreatedirstructwindsurf="ap_func_create_dirstruct_windsurf"
ap_func_create_dirstruct_windsurf() {
    if alias apcreatedirstructwindsurfshare &>/dev/null; then
        apcreatedirstructwindsurfshare
    fi

    if alias apcreatedirstructwindsurfcommon &>/dev/null; then
        apcreatedirstructwindsurfcommon
    fi

    if alias apcreatedirstructwindsurfmain &>/dev/null; then
        apcreatedirstructwindsurfmain
    fi
}

alias aprmdirstructwindsurf="ap_func_rm_dirstruct_windsurf"
ap_func_rm_dirstruct_windsurf() {
    if alias aprmdirstructwindsurfshare &>/dev/null; then
        aprmdirstructwindsurfshare
    fi

    if alias aprmdirstructwindsurfcommon &>/dev/null; then
        aprmdirstructwindsurfcommon
    fi

    if alias aprmdirstructwindsurfmain &>/dev/null; then
        aprmdirstructwindsurfmain
    fi
}

alias apsetupwindsurf="ap_func_setup_windsurf"
ap_func_setup_windsurf() {
    apshowmsginfo "Install [windsurf]\n"

    if [ "${AP_OS_TYPE}" == "${AP_OS_TYPE_MACOS}" ]; then
        # brew install --cask windsurf
        if [[ "$(uname -m)" == 'arm64' ]]; then
            curl -SL "https://windsurf-stable.codeiumdata.com/darwin-arm64-dmg/stable/ff5014a12e72ceb812f9e7f61876befac66725e5/Windsurf-darwin-arm64-${AP_WINDSURF_SETUP_VERSION}.dmg" >windsurf.dmg
        elif [[ "$(uname -m)" == 'x86_64' ]]; then
            curl -SL "https://windsurf-stable.codeiumdata.com/darwin-x64-dmg/stable/ff5014a12e72ceb812f9e7f61876befac66725e5/Windsurf-darwin-x64-${AP_WINDSURF_SETUP_VERSION}.dmg" >windsurf.dmg
        fi

        hdiutil attach -nobrowse windsurf.dmg
        rm -rf "/Applications/Windsurf.app"
        cp -R "/Volumes/Windsurf/Windsurf.app" /Applications/
        cd /Applications
        hdiutil detach "/Volumes/windsurf"
    elif [ "${AP_OS_TYPE}" == "${AP_OS_TYPE_UBUNTU}" ]; then
        curl -fsSL "https://windsurf-stable.codeiumdata.com/wVxQEIWkwPUEAGf3/windsurf.gpg" | sudo gpg --dearmor -o /usr/share/keyrings/windsurf-stable-archive-keyring.gpg
        echo "deb [signed-by=/usr/share/keyrings/windsurf-stable-archive-keyring.gpg arch=amd64] https://windsurf-stable.codeiumdata.com/wVxQEIWkwPUEAGf3/apt stable main" | sudo tee /etc/apt/sources.list.d/windsurf.list >/dev/null
        sudo apt update
        sudo apt upgrade -y windsurf
    fi

    apinitwindsurf
    if alias apcreatedirstructwindsurf &>/dev/null; then
        apcreatedirstructwindsurf
    fi
}

alias aprmwindsurf="ap_func_rm_windsurf"
ap_func_rm_windsurf() {
    apshowmsginfo "Remove [windsurf]\n"

    if [ "${AP_OS_TYPE}" == "${AP_OS_TYPE_MACOS}" ]; then
        rm -rf "/Applications/Windsurf.app"
        # brew remove --cask windsurf
    elif [ "${AP_OS_TYPE}" == "${AP_OS_TYPE_UBUNTU}" ]; then
        sudo apt remove --purge -y windsurf
        sudo apt autoremove --purge -y
    fi

    if alias aprmdirstructwindsurf &>/dev/null; then
        aprmdirstructwindsurf
    fi

    if alias aprmglobalsymlinkwindsurf &>/dev/null; then
        aprmglobalsymlinkwindsurf
    fi
}
