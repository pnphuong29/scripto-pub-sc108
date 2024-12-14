alias apinitbruno="ap_func_init_bruno"
ap_func_init_bruno() {
    export AP_BRUNO_SETUP_VERSION='1.36.1'

    if alias apinitbrunoshare &>/dev/null; then
        apinitbrunoshare
    fi

    if alias apinitbrunocommon &>/dev/null; then
        apinitbrunocommon
    fi

    if alias apinitbrunomain &>/dev/null; then
        apinitbrunomain
    fi
}

alias apcreatedirstructbruno="ap_func_create_dirstruct_bruno"
ap_func_create_dirstruct_bruno() {
    if alias apcreatedirstructbrunoshare &>/dev/null; then
        apcreatedirstructbrunoshare
    fi

    if alias apcreatedirstructbrunocommon &>/dev/null; then
        apcreatedirstructbrunocommon
    fi

    if alias apcreatedirstructbrunomain &>/dev/null; then
        apcreatedirstructbrunomain
    fi
}

alias aprmdirstructbruno="ap_func_rm_dirstruct_bruno"
ap_func_rm_dirstruct_bruno() {
    if alias aprmdirstructbrunoshare &>/dev/null; then
        aprmdirstructbrunoshare
    fi

    if alias aprmdirstructbrunocommon &>/dev/null; then
        aprmdirstructbrunocommon
    fi

    if alias aprmdirstructbrunomain &>/dev/null; then
        aprmdirstructbrunomain
    fi
}

alias apsetupbruno="ap_func_setup_bruno"
ap_func_setup_bruno() {
    local ap_bruno_setup_version="${AP_BRUNO_SETUP_VERSION}"
    if [ -n "$1" ]; then
        ap_bruno_setup_version="$1"
    fi

    aplogshow "Install [bruno] v${ap_bruno_setup_version}\n"
    rm -rf "${AP_TMP_DIR}/bruno"
    mkdir -p "${AP_TMP_DIR}/bruno"
    cd "${AP_TMP_DIR}/bruno"

    if [ "${AP_OS_TYPE}" == "${AP_OS_TYPE_MACOS}" ]; then
        if [[ "$(uname -m)" == 'arm64' ]]; then
            curl -SL "https://github.com/usebruno/bruno/releases/download/v${AP_BRUNO_SETUP_VERSION}/bruno_${AP_BRUNO_SETUP_VERSION}_arm64_mac.zip" >bruno.zip
        elif [[ "$(uname -m)" == 'x86_64' ]]; then
            curl -SL "https://github.com/usebruno/bruno/releases/download/v${AP_BRUNO_SETUP_VERSION}/bruno_${AP_BRUNO_SETUP_VERSION}_x64_mac.zip" >bruno.zip
        fi

        rm -rf "/Applications/Bruno.app"
        mv "Bruno.app" /Applications/
        cd "/Applications"
    elif [ "${AP_OS_TYPE}" == "${AP_OS_TYPE_UBUNTU}" ]; then
        curl -SL "https://github.com/usebruno/bruno/releases/download/v${AP_BRUNO_SETUP_VERSION}/bruno_${AP_BRUNO_SETUP_VERSION}_amd64_linux.deb" >bruno.deb
        sudo dpkg -i bruno.deb
    fi

    npm install -g @usebruno/cli

    apinitbruno
    if alias apcreatedirstructbruno &>/dev/null; then
        apcreatedirstructbruno
    fi
}

alias aprmbruno="ap_func_rm_bruno"
ap_func_rm_bruno() {
    local ap_bruno_remove_version="${AP_BRUNO_SETUP_VERSION}"
    if [ -n "$1" ]; then
        ap_bruno_remove_version="$1"
    fi

    aplogshow "Remove [bruno] v${ap_bruno_remove_version}\n"
    npm uninstall -g @usebruno/cli

    if [ "${AP_OS_TYPE}" == "${AP_OS_TYPE_MACOS}" ]; then
        rm -rf "/Applications/Bruno.app"
    elif [ "${AP_OS_TYPE}" == "${AP_OS_TYPE_UBUNTU}" ]; then
        sudo dpkg --purge bruno
    fi

    if alias aprmdirstructbruno &>/dev/null; then
        aprmdirstructbruno
    fi

    if alias aprmglobalsymlinkbruno &>/dev/null; then
        aprmglobalsymlinkbruno
    fi
}
