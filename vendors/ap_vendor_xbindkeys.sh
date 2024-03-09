alias apinitxbindkeys="ap_func_init_xbindkeys"
ap_func_init_xbindkeys() {
    if alias apinitxbindkeysshare &>/dev/null; then
        apinitxbindkeysshare
    fi

    if alias apinitxbindkeyscommon &>/dev/null; then
        apinitxbindkeyscommon
    fi
}

alias apcreatedirstructxbindkeys="ap_func_create_dirstruct_xbindkeys"
ap_func_create_dirstruct_xbindkeys() {
    if alias apcreatedirstructxbindkeysshare &>/dev/null; then
        apcreatedirstructxbindkeysshare
    fi

    if alias apcreatedirstructxbindkeyscommon &>/dev/null; then
        apcreatedirstructxbindkeyscommon
    fi
}

alias rmdirstructxbindkeys="ap_func_rm_dirstruct_xbindkeys"
ap_func_rm_dirstruct_xbindkeys() {
    if alias rmdirstructxbindkeysshare &>/dev/null; then
        rmdirstructxbindkeysshare
    fi

    if alias rmdirstructxbindkeyscommon &>/dev/null; then
        rmdirstructxbindkeyscommon
    fi
}

alias apsetupxbindkeys="ap_func_setup_xbindkeys"
ap_func_setup_xbindkeys() {
    # https://linux.die.net/man/1/xbindkeys
    aplogshow "Install [xbindkeys, xautomation, xdotool]\n"

    sudo apt update
    sudo apt install -y xbindkeys xautomation xdotool
    # xbindkeys_autostart

    apinitxbindkeys
    if alias apcreatedirstructxbindkeys &>/dev/null; then
        apcreatedirstructxbindkeys
    fi
}

alias rmxbindkeys="ap_func_rm_xbindkeys"
ap_func_rm_xbindkeys() {
    aplogshow "Remove [xbindkeys, xautomation, xdotool]\n"

    sudo apt purge -y xbindkeys xautomation xdotool
    sudo apt autoremove -y

    if alias rmdirstructxbindkeys &>/dev/null; then
        rmdirstructxbindkeys
    fi

    if alias rmglobalsymlinkxbindkeys &>/dev/null; then
        rmglobalsymlinkxbindkeys
    fi
}
