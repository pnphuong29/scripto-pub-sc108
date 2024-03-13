alias apinitxcp="ap_func_init_xcp"
ap_func_init_xcp() {
    if alias apinitxcpshare &>/dev/null; then
        apinitxcpshare
    fi

    if alias apinitxcpcommon &>/dev/null; then
        apinitxcpcommon
    fi
}

alias apcreatedirstructxcp="ap_func_create_dirstruct_xcp"
ap_func_create_dirstruct_xcp() {
    if alias apcreatedirstructxcpshare &>/dev/null; then
        apcreatedirstructxcpshare
    fi

    if alias apcreatedirstructxcpcommon &>/dev/null; then
        apcreatedirstructxcpcommon
    fi
}

alias aprmdirstructxcp="ap_func_rm_dirstruct_xcp"
ap_func_rm_dirstruct_xcp() {
    if alias aprmdirstructxcpshare &>/dev/null; then
        aprmdirstructxcpshare
    fi

    if alias aprmdirstructxcpcommon &>/dev/null; then
        aprmdirstructxcpcommon
    fi
}

alias apcreateglobalsymlinkxcp="ap_func_create_global_symlink_xcp"
ap_func_create_global_symlink_xcp() {
    if [ -f "${HOME}/.cargo/bin/xcp" ]; then
        aplogshow "Create symlink from [/usr/local/bin/xcp] to [${HOME}/.cargo/bin/xcp]\n"
        sudo ln -sf "${HOME}/.cargo/bin/xcp" "/usr/local/bin/xcp"
    fi
}

alias aprmglobalsymlinkxcp="ap_func_rm_global_symlink_xcp"
ap_func_rm_global_symlink_xcp() {
    aplogshow "Remove [/usr/local/bin/xcp]\n"
    sudo rm -f "/usr/local/bin/xcp"
}

alias apsetupxcp="ap_func_setup_xcp"
ap_func_setup_xcp() {
    aplogshow "Install [xcp]\n"
    cargo install xcp

    apinitxcp
    if alias apcreatedirstructxcp &>/dev/null; then
        apcreatedirstructxcp
    fi
}

alias aprmxcp="ap_func_rm_xcp"
ap_func_rm_xcp() {
    aplogshow "Remove [xcp]\n"
    cargo uninstall xcp

    if alias aprmdirstructxcp &>/dev/null; then
        aprmdirstructxcp
    fi

    if alias aprmglobalsymlinkxcp &>/dev/null; then
        aprmglobalsymlinkxcp
    fi
}
