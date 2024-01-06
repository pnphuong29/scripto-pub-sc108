alias @initxbindkeys="ap_func_init_xbindkeys"
ap_func_init_xbindkeys() {
    if alias @initxbindkeysshare &>/dev/null; then
        @initxbindkeysshare
    fi

    if alias @initxbindkeyscommon &>/dev/null; then
        @initxbindkeyscommon
    fi
}

alias @createdirstructxbindkeys="ap_func_create_dirstruct_xbindkeys"
ap_func_create_dirstruct_xbindkeys() {
    if alias @createdirstructxbindkeysshare &>/dev/null; then
        @createdirstructxbindkeysshare
    fi

    if alias @createdirstructxbindkeyscommon &>/dev/null; then
        @createdirstructxbindkeyscommon
    fi
}

alias @rmdirstructxbindkeys="ap_func_rm_dirstruct_xbindkeys"
ap_func_rm_dirstruct_xbindkeys() {
    if alias @rmdirstructxbindkeysshare &>/dev/null; then
        @rmdirstructxbindkeysshare
    fi

    if alias @rmdirstructxbindkeyscommon &>/dev/null; then
        @rmdirstructxbindkeyscommon
    fi
}

alias @setupxbindkeys="ap_func_setup_xbindkeys"
ap_func_setup_xbindkeys() {
    # https://linux.die.net/man/1/xbindkeys
    @logshow "Install [xbindkeys, xautomation, xdotool]\n"

    sudo apt update
    sudo apt install -y xbindkeys xautomation xdotool
    # xbindkeys_autostart

    @initxbindkeys
    if alias @createdirstructxbindkeys &>/dev/null; then
        @createdirstructxbindkeys
    fi
}

alias @rmxbindkeys="ap_func_rm_xbindkeys"
ap_func_rm_xbindkeys() {
    @logshow "Remove [xbindkeys, xautomation, xdotool]\n"

    sudo apt purge -y xbindkeys xautomation xdotool
    sudo apt autoremove -y

    if alias @rmdirstructxbindkeys &>/dev/null; then
        @rmdirstructxbindkeys
    fi

    if alias @rmglobalsymlinkxbindkeys &>/dev/null; then
        @rmglobalsymlinkxbindkeys
    fi
}
