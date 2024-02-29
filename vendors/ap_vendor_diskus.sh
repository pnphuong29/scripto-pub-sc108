alias @createglobalsymlinkdiskus="ap_func_create_global_symlink_diskus"
ap_func_create_global_symlink_diskus() {
    if [ -f "${HOME}/.cargo/bin/diskus" ]; then
        @logshow "Create symlink from [/usr/local/bin/diskus] to [${HOME}/.cargo/bin/diskus]\n"
        sudo ln -sf "${HOME}/.cargo/bin/diskus" "/usr/local/bin/diskus"
    fi
}

alias @rmglobalsymlinkdiskus="ap_func_rm_global_symlink_diskus"
ap_func_rm_global_symlink_diskus() {
    if [ -f "/usr/local/bin/diskus" ]; then
        @logshow "Remove [/usr/local/bin/diskus]\n"
        sudo rm -f "/usr/local/bin/diskus"
    fi
}
