alias @initxcp="ap_func_init_xcp"
ap_func_init_xcp() {
    if alias @initxcpcommon &>/dev/null; then
        @initxcpcommon
    fi
}

alias @createdirstructxcp="ap_func_create_dirstruct_xcp"
ap_func_create_dirstruct_xcp() {
    if alias @createdirstructxcpcommon &>/dev/null; then
        @createdirstructxcpcommon
    fi
}

alias @rmdirstructxcp="ap_func_remove_dirstruct_xcp"
ap_func_remove_dirstruct_xcp() {
    if alias @rmdirstructxcpcommon &>/dev/null; then
        @rmdirstructxcpcommon
    fi
}

alias @createglobalsymlinkxcp="ap_func_create_global_symlink_xcp"
ap_func_create_global_symlink_xcp() {
    if [ -f "${HOME}/.cargo/bin/xcp" ]; then
        @logshow "Create symlink from [/usr/local/bin/xcp] to [${HOME}/.cargo/bin/xcp]\n"
        sudo ln -sf "${HOME}/.cargo/bin/xcp" "/usr/local/bin/xcp"
    fi
}

alias @rmglobalsymlinkxcp="ap_func_remove_global_symlink_xcp"
ap_func_remove_global_symlink_xcp() {
    if [ -f "/usr/local/bin/xcp" ]; then
        @logshow "Remove [/usr/local/bin/xcp]\n"
        sudo rm -f "/usr/local/bin/xcp"
    fi
}

alias @setupxcp="ap_func_setup_xcp"
ap_func_setup_xcp() {
    @logshow "Install [xcp]\n"
    cargo install xcp

    if alias @createdirstructxcp &>/dev/null; then
        @createdirstructxcp
    fi

    if alias @createglobalsymlinkxcp &>/dev/null; then
        @createglobalsymlinkxcp
    fi
}

alias @rmxcp="ap_func_remove_xcp"
ap_func_remove_xcp() {
    @logshow "Remove [xcp]\n"
    cargo uninstall xcp

    if alias @rmdirstructxcp &>/dev/null; then
        @rmdirstructxcp
    fi

    if alias @rmglobalsymlinkxcp &>/dev/null; then
        @rmglobalsymlinkxcp
    fi
}
