alias apinitinkscape="ap_func_init_inkscape"
ap_func_init_inkscape() {
    if alias apinitinkscapeshare &>/dev/null; then
        apinitinkscapeshare
    fi

    if alias apinitinkscapecommon &>/dev/null; then
        apinitinkscapecommon
    fi

    if alias apinitinkscapemain &>/dev/null; then
        apinitinkscapemain
    fi
}

alias apcreatedirstructinkscape="ap_func_create_dirstruct_inkscape"
ap_func_create_dirstruct_inkscape() {
    if alias apcreatedirstructinkscapeshare &>/dev/null; then
        apcreatedirstructinkscapeshare
    fi

    if alias apcreatedirstructinkscapecommon &>/dev/null; then
        apcreatedirstructinkscapecommon
    fi

    if alias apcreatedirstructinkscapemain &>/dev/null; then
        apcreatedirstructinkscapemain
    fi
}

alias aprmdirstructinkscape="ap_func_rm_dirstruct_inkscape"
ap_func_rm_dirstruct_inkscape() {
    if alias aprmdirstructinkscapeshare &>/dev/null; then
        aprmdirstructinkscapeshare
    fi

    if alias aprmdirstructinkscapecommon &>/dev/null; then
        aprmdirstructinkscapecommon
    fi

    if alias aprmdirstructinkscapemain &>/dev/null; then
        aprmdirstructinkscapemain
    fi
}

alias apsetupinkscape="ap_func_setup_inkscape"
ap_func_setup_inkscape() {
    aplogshow "Install [inkscape]\n"

    if [ "${AP_OS_TYPE}" == "${AP_OS_TYPE_MACOS}" ]; then
        brew install --cask inkscape
    elif [ "${AP_OS_TYPE}" == "${AP_OS_TYPE_UBUNTU}" ]; then
        sudo add-apt-repository -y ppa:inkscape.dev/stable
        sudo apt update
        sudo apt install -y inkscape
    fi

    apinitinkscape
    if alias apcreatedirstructinkscape &>/dev/null; then
        apcreatedirstructinkscape
    fi
}

alias aprminkscape="ap_func_rm_inkscape"
ap_func_rm_inkscape() {
    aplogshow "Remove [inkscape]\n"

    if [ "${AP_OS_TYPE}" == "${AP_OS_TYPE_MACOS}" ]; then
        brew remove --cask inkscape
    elif [ "${AP_OS_TYPE}" == "${AP_OS_TYPE_UBUNTU}" ]; then
        sudo apt purge -y inkscape
        sudo add-apt-repository -y ppa:inkscape.dev/stable
        sudo apt update
    fi

    if alias aprmdirstructinkscape &>/dev/null; then
        aprmdirstructinkscape
    fi

    if alias aprmglobalsymlinkinkscape &>/dev/null; then
        aprmglobalsymlinkinkscape
    fi
}
