alias apinitunison="ap_func_init_unison"
ap_func_init_unison() {
    if alias apinitunisonshare &>/dev/null; then
        apinitunisonshare
    fi

    if alias apinitunisoncommon &>/dev/null; then
        apinitunisoncommon
    fi

    if alias apinitunisonmain &>/dev/null; then
        apinitunisonmain
    fi
}

alias apcreatedirstructunison="ap_func_create_dirstruct_unison"
ap_func_create_dirstruct_unison() {
    if alias apcreatedirstructunisonshare &>/dev/null; then
        apcreatedirstructunisonshare
    fi

    if alias apcreatedirstructunisoncommon &>/dev/null; then
        apcreatedirstructunisoncommon
    fi

    if alias apcreatedirstructunisonmain &>/dev/null; then
        apcreatedirstructunisonmain
    fi
}

alias aprmdirstructunison="ap_func_rm_dirstruct_unison"
ap_func_rm_dirstruct_unison() {
    if alias aprmdirstructunisonshare &>/dev/null; then
        aprmdirstructunisonshare
    fi

    if alias aprmdirstructunisoncommon &>/dev/null; then
        aprmdirstructunisoncommon
    fi

    if alias aprmdirstructunisonmain &>/dev/null; then
        aprmdirstructunisonmain
    fi
}

alias apcreateglobalsymlinkunison="ap_func_create_global_symlink_unison"
ap_func_create_global_symlink_unison() {
    if type brew &>/dev/null; then
        ap_brew_prefix="$(brew --prefix)"
        if [ -f "${ap_brew_prefix}/bin/unison" ]; then
            apshowmsginfo "Create symlink from [/usr/local/bin/unison] to [${ap_brew_prefix}/bin/unison]\n"
            sudo ln -sf "${ap_brew_prefix}/bin/unison" "/usr/local/bin/unison"
        fi
    fi
}

alias aprmglobalsymlinkunison="ap_func_rm_global_symlink_unison"
ap_func_rm_global_symlink_unison() {
    if [ -f "/usr/local/bin/unison" ]; then
        apshowmsginfo "Remove [/usr/local/bin/unison]\n"
        sudo rm -f "/usr/local/bin/unison"
    fi
}

alias apsetupunison="ap_func_setup_unison"
ap_func_setup_unison() {
    apshowmsginfo "Install [unison]\n"

    if [ "${AP_OS_TYPE}" == "${AP_OS_TYPE_MACOS}" ]; then
        brew install unison
    elif [ "${AP_OS_TYPE}" == "${AP_OS_TYPE_UBUNTU}" ]; then
        sudo apt install -y unison
    fi

    apinitunison
    apcreateglobalsymlinkunison

    if alias apcreatedirstructunison &>/dev/null; then
        apcreatedirstructunison
    fi
}

alias aprmunison="ap_func_rm_unison"
ap_func_rm_unison() {
    apshowmsginfo "Remove [unison]\n"

    if [ "${AP_OS_TYPE}" == "${AP_OS_TYPE_MACOS}" ]; then
        brew remove unison
    elif [ "${AP_OS_TYPE}" == "${AP_OS_TYPE_UBUNTU}" ]; then
        sudo apt remove --purge -y unison
        sudo apt autoremove --purge -y
    fi

    if alias aprmdirstructunison &>/dev/null; then
        aprmdirstructunison
    fi

    if alias aprmglobalsymlinkunison &>/dev/null; then
        aprmglobalsymlinkunison
    fi
}
