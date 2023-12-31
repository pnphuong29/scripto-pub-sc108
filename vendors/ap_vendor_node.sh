alias @createglobalsymlinknode="ap_func_create_global_symlink_node"
ap_func_create_global_symlink_node() {
    local ap_path
    ap_path="$(nvm which node | cut -d ' ' -f 3)"

    if [ -f "${ap_path}" ]; then
        @logshow "Create symlink from [/usr/local/bin/node] to [${ap_path}]\n"
        sudo ln -sf "${ap_path}" "/usr/local/bin/node"

        @logshow "Create symlink from [/usr/local/bin/npm] to [${ap_path%/*}/npm]\n"
        sudo ln -sf "${ap_path%/*}/npm" "/usr/local/bin/npm"

        @logshow "Create symlink from [/usr/local/bin/yarn] to [${ap_path%/*}/yarn]\n"
        sudo ln -sf "${ap_path%/*}/yarn" "/usr/local/bin/yarn"
    fi
}

alias @rmglobalsymlinknode="ap_func_rm_global_symlink_node"
ap_func_rm_global_symlink_node() {
    if [ -f "/usr/local/bin/node" ]; then
        @logshow "Remove [/usr/local/bin/node]\n"
        sudo rm -f "/usr/local/bin/node"
    fi

    if [ -f "/usr/local/bin/npm" ]; then
        @logshow "Remove [/usr/local/bin/npm]\n"
        sudo rm -f "/usr/local/bin/npm"
    fi

    if [ -f "/usr/local/bin/yarn" ]; then
        @logshow "Remove [/usr/local/bin/yarn]\n"
        sudo rm -f "/usr/local/bin/yarn"
    fi
}
