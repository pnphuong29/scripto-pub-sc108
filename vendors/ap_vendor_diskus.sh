alias apinitdiskus="ap_func_init_diskus"
ap_func_init_diskus() {
    if alias apinitdiskusshare &>/dev/null; then
        apinitdiskusshare
    fi

    if alias apinitdiskuscommon &>/dev/null; then
        apinitdiskuscommon
    fi

    if alias apinitdiskusmain &>/dev/null; then
        apinitdiskusmain
    fi
}

alias apcreatedirstructdiskus="ap_func_create_dirstruct_diskus"
ap_func_create_dirstruct_diskus() {
    if alias apcreatedirstructdiskusshare &>/dev/null; then
        apcreatedirstructdiskusshare
    fi

    if alias apcreatedirstructdiskuscommon &>/dev/null; then
        apcreatedirstructdiskuscommon
    fi

    if alias apcreatedirstructdiskusmain &>/dev/null; then
        apcreatedirstructdiskusmain
    fi
}

alias aprmdirstructdiskus="ap_func_rm_dirstruct_diskus"
ap_func_rm_dirstruct_diskus() {
    if alias aprmdirstructdiskusshare &>/dev/null; then
        aprmdirstructdiskusshare
    fi

    if alias aprmdirstructdiskuscommon &>/dev/null; then
        aprmdirstructdiskuscommon
    fi

    if alias aprmdirstructdiskusmain &>/dev/null; then
        aprmdirstructdiskusmain
    fi
}

alias apcreateglobalsymlinkdiskus="ap_func_create_global_symlink_diskus"
ap_func_create_global_symlink_diskus() {
    if [ -f "${HOME}/.cargo/bin/diskus" ]; then
        aplogshow "Create symlink from [/usr/local/bin/diskus] to [${HOME}/.cargo/bin/diskus]\n"
        sudo ln -sf "${HOME}/.cargo/bin/diskus" "/usr/local/bin/diskus"
    fi
}

alias aprmglobalsymlinkdiskus="ap_func_rm_global_symlink_diskus"
ap_func_rm_global_symlink_diskus() {
    if [ -f "/usr/local/bin/diskus" ]; then
        aplogshow "Remove [/usr/local/bin/diskus]\n"
        sudo rm -f "/usr/local/bin/diskus"
    fi
}

alias apsetupdiskus="ap_func_setup_diskus"
ap_func_setup_diskus() {
    aplogshow "Install [diskus]\n"

    cargo install diskus
    apinitdiskus
    apcreateglobalsymlinkdiskus

    if alias apcreatedirstructdiskus &>/dev/null; then
        apcreatedirstructdiskus
    fi
}

alias aprmdiskus="ap_func_rm_diskus"
ap_func_rm_diskus() {
    aplogshow "Remove [diskus]\n"
    cargo uninstall diskus

    if alias aprmdirstructdiskus &>/dev/null; then
        aprmdirstructdiskus
    fi

    if alias aprmglobalsymlinkdiskus &>/dev/null; then
        aprmglobalsymlinkdiskus
    fi
}
