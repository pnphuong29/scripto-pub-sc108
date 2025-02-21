alias apinitgpg="ap_func_init_gpg"
ap_func_init_gpg() {
    if alias apinitgpgshare &>/dev/null; then
        apinitgpgshare
    fi

    if alias apinitgpgcommon &>/dev/null; then
        apinitgpgcommon
    fi

    if alias apinitgpgmain &>/dev/null; then
        apinitgpgmain
    fi
}

alias apcreatedirstructgpg="ap_func_create_dirstruct_gpg"
ap_func_create_dirstruct_gpg() {
    if alias apcreatedirstructgpgshare &>/dev/null; then
        apcreatedirstructgpgshare
    fi

    if alias apcreatedirstructgpgcommon &>/dev/null; then
        apcreatedirstructgpgcommon
    fi

    if alias apcreatedirstructgpgmain &>/dev/null; then
        apcreatedirstructgpgmain
    fi
}

alias aprmdirstructgpg="ap_func_rm_dirstruct_gpg"
ap_func_rm_dirstruct_gpg() {
    if alias aprmdirstructgpgshare &>/dev/null; then
        aprmdirstructgpgshare
    fi

    if alias aprmdirstructgpgcommon &>/dev/null; then
        aprmdirstructgpgcommon
    fi

    if alias aprmdirstructgpgmain &>/dev/null; then
        aprmdirstructgpgmain
    fi
}

alias apcreateglobalsymlinkgpg="ap_func_create_global_symlink_gpg"
ap_func_create_global_symlink_gpg() {
    if [ "${AP_OS_TYPE}" == "${AP_OS_TYPE_MACOS}" ]; then
        if [ -f "/opt/homebrew/bin/gpg" ]; then
            apshowmsginfo "Create symlink from [/usr/local/bin/gpg] to [/opt/homebrew/bin/gpg]\n"
            sudo ln -sf "/opt/homebrew/bin/gpg" "/usr/local/bin/gpg"
        fi
    fi
}

alias aprmglobalsymlinkgpg="ap_func_rm_global_symlink_gpg"
ap_func_rm_global_symlink_gpg() {
    if [ "${AP_OS_TYPE}" == "${AP_OS_TYPE_MACOS}" ]; then
        if [ -f "/usr/local/bin/gpg" ]; then
            apshowmsginfo "Remove [/usr/local/bin/gpg]\n"
            sudo rm -f "/usr/local/bin/gpg"
        fi
    fi
}

alias apsetupgpg="ap_func_setup_gpg"
ap_func_setup_gpg() {
    apshowmsginfo "Install [gpg]\n"

    if [ "${AP_OS_TYPE}" == "${AP_OS_TYPE_MACOS}" ]; then
        brew install gpg2
    elif [ "${AP_OS_TYPE}" == "${AP_OS_TYPE_UBUNTU}" ]; then
        sudo apt install -y gpg
    fi

    apinitgpg
    if alias apcreatedirstructgpg &>/dev/null; then
        apcreatedirstructgpg
    fi
}

alias aprmgpg="ap_func_rm_gpg"
ap_func_rm_gpg() {
    apshowmsginfo "Remove [gpg]\n"

    if [ "${AP_OS_TYPE}" == "${AP_OS_TYPE_MACOS}" ]; then
        brew remove gpg2
    elif [ "${AP_OS_TYPE}" == "${AP_OS_TYPE_UBUNTU}" ]; then
        sudo apt remove --purge -y gpg
        sudo apt autoremove --purge -y
    fi

    if alias aprmdirstructgpg &>/dev/null; then
        aprmdirstructgpg
    fi

    if alias aprmglobalsymlinkgpg &>/dev/null; then
        aprmglobalsymlinkgpg
    fi
}
