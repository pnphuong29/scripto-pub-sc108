alias apinitfastfetch="ap_func_init_fastfetch"
ap_func_init_fastfetch() {
    if alias apinitfastfetchshare &>/dev/null; then
        apinitfastfetchshare
    fi

    if alias apinitfastfetchcommon &>/dev/null; then
        apinitfastfetchcommon
    fi

    if alias apinitfastfetchmain &>/dev/null; then
        apinitfastfetchmain
    fi
}

alias apcreatedirstructfastfetch="ap_func_create_dirstruct_fastfetch"
ap_func_create_dirstruct_fastfetch() {
    aplogshow "Create directory [${HOME}/.config/fastfetch]\n"
    mkdir -p "${HOME}/.config/fastfetch"

    if alias apcreatedirstructfastfetchshare &>/dev/null; then
        apcreatedirstructfastfetchshare
    fi

    if alias apcreatedirstructfastfetchcommon &>/dev/null; then
        apcreatedirstructfastfetchcommon
    fi

    if alias apcreatedirstructfastfetchmain &>/dev/null; then
        apcreatedirstructfastfetchmain
    fi
}

alias aprmdirstructfastfetch="ap_func_rm_dirstruct_fastfetch"
ap_func_rm_dirstruct_fastfetch() {
    aplogshow "Remove directory [${HOME}/.config/fastfetch]\n"
    rm -rf "${HOME}/.config/fastfetch"

    if alias aprmdirstructfastfetchshare &>/dev/null; then
        aprmdirstructfastfetchshare
    fi

    if alias aprmdirstructfastfetchcommon &>/dev/null; then
        aprmdirstructfastfetchcommon
    fi

    if alias aprmdirstructfastfetchmain &>/dev/null; then
        aprmdirstructfastfetchmain
    fi
}

alias apsetupfastfetch="ap_func_setup_fastfetch"
ap_func_setup_fastfetch() {
    aplogshow "Install [fastfetch]\n"

    # TODO: Build from source is better
    if [ "${AP_OS_TYPE}" == "${AP_OS_TYPE_MACOS}" ]; then
        brew install fastfetch
    elif [ "${AP_OS_TYPE}" == "${AP_OS_TYPE_UBUNTU}" ]; then
        sudo add-apt-repository ppa:zhangsongcui3371/fastfetch
        sudo apt update
        sudo apt install -y fastfetch
    fi

    apinitfastfetch
    if alias apcreatedirstructfastfetch &>/dev/null; then
        apcreatedirstructfastfetch
    fi
}

alias aprmfastfetch="ap_func_rm_fastfetch"
ap_func_rm_fastfetch() {
    if [ "${AP_OS_TYPE}" == "${AP_OS_TYPE_MACOS}" ]; then
        brew remove fastfetch
    elif [ "${AP_OS_TYPE}" == "${AP_OS_TYPE_UBUNTU}" ]; then
        sudo ppa-purge ppa:zhangsongcui3371/fastfetch
        sudo apt purge -y fastfetch
    fi

    if alias aprmdirstructfastfetch &>/dev/null; then
        aprmdirstructfastfetch
    fi

    if alias aprmglobalsymlinkfastfetch &>/dev/null; then
        aprmglobalsymlinkfastfetch
    fi
}
