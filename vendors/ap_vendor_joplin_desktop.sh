alias @initjoplindesktop="ap_func_init_joplindesktop"
ap_func_init_joplindesktop() {
    if alias @initjoplindesktopshare &>/dev/null; then
        @initjoplindesktopshare
    fi

    if alias @initjoplindesktopcommon &>/dev/null; then
        @initjoplindesktopcommon
    fi
}

alias @createdirstructjoplindesktop="ap_func_create_dirstruct_joplindesktop"
ap_func_create_dirstruct_joplindesktop() {
    if alias @createdirstructjoplindesktopshare &>/dev/null; then
        @createdirstructjoplindesktopshare
    fi

    if alias @createdirstructjoplindesktopcommon &>/dev/null; then
        @createdirstructjoplindesktopcommon
    fi
}

alias @rmdirstructjoplindesktop="ap_func_rm_dirstruct_joplindesktop"
ap_func_rm_dirstruct_joplindesktop() {
    if alias @rmdirstructjoplindesktopshare &>/dev/null; then
        @rmdirstructjoplindesktopshare
    fi

    if alias @rmdirstructjoplindesktopcommon &>/dev/null; then
        @rmdirstructjoplindesktopcommon
    fi
}

alias @setupjoplindesktop="ap_func_setup_joplin_desktop"
ap_func_setup_joplin_desktop() {
    # https://joplinapp.org/help/install
    @logshow "Install [Joplin Desktop]\n"

    if [ "${AP_OS_TYPE}" == "${AP_OS_TYPE_MACOS}" ]; then
        brew install --cask joplin
    elif [ "${AP_OS_TYPE}" == "${AP_OS_TYPE_UBUNTU}" ]; then
        if [ -n "${XDG_CURRENT_DESKTOP:-}" ]; then
            wget -O - https://raw.githubusercontent.com/laurent22/joplin/dev/Joplin_install_and_update.sh | bash
        fi
    fi

    @initjoplindesktop
    if alias @createdirstructjoplindesktop &>/dev/null; then
        @createdirstructjoplindesktop
    fi
}

alias @rmjoplindesktop="ap_func_rm_joplin_desktop"
ap_func_rm_joplin_desktop() {
    @logshow "Remove [Joplin Desktop]\n"

    if [ "${AP_OS_TYPE}" == "${AP_OS_TYPE_MACOS}" ]; then
        brew uninstall --cask joplin
    elif [ "${AP_OS_TYPE}" == "${AP_OS_TYPE_UBUNTU}" ]; then
        rm -rf "${HOME}/.joplin"
    fi

    if alias @rmdirstructjoplindesktop &>/dev/null; then
        @rmdirstructjoplindesktop
    fi

    if alias @rmglobalsymlinkjoplindesktop &>/dev/null; then
        @rmglobalsymlinkjoplindesktop
    fi
}
