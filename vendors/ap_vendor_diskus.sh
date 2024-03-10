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
