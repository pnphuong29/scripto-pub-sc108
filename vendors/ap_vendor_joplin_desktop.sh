alias apinitjoplindesktop="ap_func_init_joplindesktop"
ap_func_init_joplindesktop() {
    if alias apinitjoplindesktopshare &>/dev/null; then
        apinitjoplindesktopshare
    fi

    if alias apinitjoplindesktopcommon &>/dev/null; then
        apinitjoplindesktopcommon
    fi
}

alias apcreatedirstructjoplindesktop="ap_func_create_dirstruct_joplindesktop"
ap_func_create_dirstruct_joplindesktop() {
    if alias apcreatedirstructjoplindesktopshare &>/dev/null; then
        apcreatedirstructjoplindesktopshare
    fi

    if alias apcreatedirstructjoplindesktopcommon &>/dev/null; then
        apcreatedirstructjoplindesktopcommon
    fi
}

alias rmdirstructjoplindesktop="ap_func_rm_dirstruct_joplindesktop"
ap_func_rm_dirstruct_joplindesktop() {
    if alias rmdirstructjoplindesktopshare &>/dev/null; then
        rmdirstructjoplindesktopshare
    fi

    if alias rmdirstructjoplindesktopcommon &>/dev/null; then
        rmdirstructjoplindesktopcommon
    fi
}

alias apsetupjoplindesktop="ap_func_setup_joplindesktop"
ap_func_setup_joplindesktop() {
    # https://joplinapp.org/help/install
    aplogshow "Install [Joplin Desktop]\n"

    if [ "${AP_OS_TYPE}" == "${AP_OS_TYPE_MACOS}" ]; then
        brew install --cask joplin
    elif [ "${AP_OS_TYPE}" == "${AP_OS_TYPE_UBUNTU}" ]; then
        if [ -n "${XDG_CURRENT_DESKTOP:-}" ]; then
            wget -O - https://raw.githubusercontent.com/laurent22/joplin/dev/Joplin_install_and_update.sh | bash
        fi
    fi

    apinitjoplindesktop
    if alias apcreatedirstructjoplindesktop &>/dev/null; then
        apcreatedirstructjoplindesktop
    fi
}

alias rmjoplindesktop="ap_func_rm_joplindesktop"
ap_func_rm_joplindesktop() {
    aplogshow "Remove [Joplin Desktop]\n"

    if [ "${AP_OS_TYPE}" == "${AP_OS_TYPE_MACOS}" ]; then
        brew uninstall --cask joplin
    elif [ "${AP_OS_TYPE}" == "${AP_OS_TYPE_UBUNTU}" ]; then
        rm -rf "${HOME}/.joplin"
    fi

    if alias rmdirstructjoplindesktop &>/dev/null; then
        rmdirstructjoplindesktop
    fi

    if alias rmglobalsymlinkjoplindesktop &>/dev/null; then
        rmglobalsymlinkjoplindesktop
    fi
}
