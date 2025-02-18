alias apinitsshfs="ap_func_init_sshfs"
ap_func_init_sshfs() {
    if alias apinitsshfsshare &>/dev/null; then
        apinitsshfsshare
    fi

    if alias apinitsshfscommon &>/dev/null; then
        apinitsshfscommon
    fi

    if alias apinitsshfsmain &>/dev/null; then
        apinitsshfsmain
    fi
}

alias apcreatedirstructsshfs="ap_func_create_dirstruct_sshfs"
ap_func_create_dirstruct_sshfs() {
    if alias apcreatedirstructsshfsshare &>/dev/null; then
        apcreatedirstructsshfsshare
    fi

    if alias apcreatedirstructsshfscommon &>/dev/null; then
        apcreatedirstructsshfscommon
    fi

    if alias apcreatedirstructsshfsmain &>/dev/null; then
        apcreatedirstructsshfsmain
    fi
}

alias aprmdirstructsshfs="ap_func_rm_dirstruct_sshfs"
ap_func_rm_dirstruct_sshfs() {
    if alias aprmdirstructsshfsshare &>/dev/null; then
        aprmdirstructsshfsshare
    fi

    if alias aprmdirstructsshfscommon &>/dev/null; then
        aprmdirstructsshfscommon
    fi

    if alias aprmdirstructsshfsmain &>/dev/null; then
        aprmdirstructsshfsmain
    fi
}

alias apsetupsshfs="ap_func_setup_sshfs"
ap_func_setup_sshfs() {
    apshowmsginfo "Install [sshfs]\n"

    if [ "${AP_OS_TYPE}" == "${AP_OS_TYPE_MACOS}" ]; then
        brew install sshfs
    elif [ "${AP_OS_TYPE}" == "${AP_OS_TYPE_UBUNTU}" ]; then
        sudo apt install -y sshfs
    fi

    apinitsshfs
    if alias apcreatedirstructsshfs &>/dev/null; then
        apcreatedirstructsshfs
    fi
}

alias aprmsshfs="ap_func_rm_sshfs"
ap_func_rm_sshfs() {
    apshowmsginfo "Remove [sshfs]\n"

    if [ "${AP_OS_TYPE}" == "${AP_OS_TYPE_MACOS}" ]; then
        brew remove --cask sshfs
    elif [ "${AP_OS_TYPE}" == "${AP_OS_TYPE_UBUNTU}" ]; then
        sudo apt remove --purge -y sshfs
        sudo apt autoremove --purge -y
    fi

    if alias aprmdirstructsshfs &>/dev/null; then
        aprmdirstructsshfs
    fi

    if alias aprmglobalsymlinksshfs &>/dev/null; then
        aprmglobalsymlinksshfs
    fi
}
