alias apinithyper="ap_func_init_hyper"
ap_func_init_hyper() {
    if alias apinithypershare &>/dev/null; then
        apinithypershare
    fi

    if alias apinithypercommon &>/dev/null; then
        apinithypercommon
    fi
}

alias apcreatedirstructhyper="ap_func_create_dirstruct_hyper"
ap_func_create_dirstruct_hyper() {
    if alias apcreatedirstructhypershare &>/dev/null; then
        apcreatedirstructhypershare
    fi

    if alias apcreatedirstructhypercommon &>/dev/null; then
        apcreatedirstructhypercommon
    fi
}

alias aprmdirstructhyper="ap_func_rm_dirstruct_hyper"
ap_func_rm_dirstruct_hyper() {
    if alias aprmdirstructhypershare &>/dev/null; then
        aprmdirstructhypershare
    fi

    if alias aprmdirstructhypercommon &>/dev/null; then
        aprmdirstructhypercommon
    fi
}

alias apsetuphyper="ap_func_setup_hyper"
ap_func_setup_hyper() {
    aplogshow "Install [hyper]\n"

    # Remove old app dir if any
    rm -rf "${AP_TMP_DIR}/hyper"*

    # Install hyper
    mkdir -p "${AP_TMP_DIR}/hyper"
    cd "${AP_TMP_DIR}/hyper"

    if [ "${AP_OS_TYPE}" == "${AP_OS_TYPE_MACOS}" ]; then
        if [[ "$(uname -m)" == 'arm64' ]]; then
            curl -SL \
                "$(curl --silent https://api.github.com/repos/vercel/hyper/releases | jq -r '.[].assets[].browser_download_url' | grep -v canary | grep "mac-arm64.zip$" | head -1)" >hyper.zip
        elif [[ "$(uname -m)" == 'x86_64' ]]; then
            curl -SL \
                "$(curl --silent https://api.github.com/repos/vercel/hyper/releases | jq -r '.[].assets[].browser_download_url' | grep -v canary | grep "mac-x64.zip$" | head -1)" >hyper.zip
        fi

        unzip hyper.zip
        rm -rf /Applications/Hyper.app
        mv Hyper.app /Applications/
    elif [ "${AP_OS_TYPE}" == "${AP_OS_TYPE_UBUNTU}" ]; then
        curl -SL \
            "$(curl --silent https://api.github.com/repos/vercel/hyper/releases | jq -r '.[].assets[].browser_download_url' | grep -v canary | grep "amd64.deb$" | head -1)" >hyper.deb
        sudo dpkg -i hyper.deb
    fi

    apinithyper
    if alias apcreatedirstructhyper &>/dev/null; then
        apcreatedirstructhyper
    fi
}

alias aprmhyper="ap_func_rm_hyper"
ap_func_rm_hyper() {
    aplogshow "Remove [hyper]\n"

    if [ "${AP_OS_TYPE}" == "${AP_OS_TYPE_MACOS}" ]; then
        rm -rf /Applications/Hyper.app
    elif [ "${AP_OS_TYPE}" == "${AP_OS_TYPE_UBUNTU}" ]; then
        sudo dpkg --purge hyper
    fi

    if alias aprmdirstructhyper &>/dev/null; then
        aprmdirstructhyper
    fi
}
